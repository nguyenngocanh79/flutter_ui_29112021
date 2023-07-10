//https://stackoverflow.com/questions/54522980/flutter-adjust-height-of-pageview-horizontal-listview-based-on-current-child
import 'package:flutter/material.dart';
import 'package:flutter_ui_29112021/customTabbarParam.dart';
import 'package:flutter_ui_29112021/sizeReportingWidget.dart';

import 'custom_tabbar.dart';

class ExpandablePageView2 extends StatefulWidget {
  PageController pageController;
  final List<Widget> children;
  Duration animationDuration;
  Curve animationCurve;

  PageViewParam pageViewParam;
  // PageParam pageParam;

  ExpandablePageView2({
    Key? key,
    required this.pageController,
    required this.children,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOutCubic,

    this.pageViewParam = const PageViewParam(),
    // required this.pageParam,
  }) : super(key: key);

  @override
  State<ExpandablePageView2> createState() => ExpandablePageView2State();
}

class ExpandablePageView2State extends State<ExpandablePageView2>
    with TickerProviderStateMixin{
  late List<double> _heights;
  int currentPage = 0;

  double get _currentHeight => _heights[currentPage];

  // @override
  // void initState() {
  //   _heights = widget.children.map((e) => 0.0).toList();
  //   super.initState();
  //   _pageController = PageController()
  //     ..addListener(() {
  //       final newPage = _pageController.page?.round() ?? 0;
  //       if (_currentPage != newPage) {
  //         setState(() => _currentPage = newPage);
  //       }
  //     });
  // }
  @override
  void initState() {
    _heights = widget.children.map((e) => 0.0).toList();
    super.initState();
    widget.pageController.addListener(() {
      final newPage = widget.pageController.page?.round() ?? 0;
      CustomTabbarState tabPage = CustomTabbar.getData(context);
      if (currentPage != newPage) {

        if(currentPage < newPage){
          // Moving forward
          if(!tabPage.tabController.indexIsChanging){
            //Nếu KHÔNG là kết quả của click tap hay tabController.animateTo
            // if(tabPage.tabController.index < tabPage.tabController.length - 1) tabPage.tabController.index++;
            // tabPage.tabKey.currentState?.setTabIndex(tabPage.tabController.index);
            // widget.pageParam.tabChangeEnable = false;
            // if(tabPage.tabController.index < tabPage.tabController.length - 1){
            //   tabPage.tabController.animateTo(
            //       tabPage.tabController.index + 1,
            //       // duration: widget.animationDuration,
            //       curve: widget.animationCurve);
            // }

          }

          // tabPage.setParam(PageParam(tabChangeEnable: false));

        }else{
          if(!tabPage.tabController.indexIsChanging){
            // if(tabPage.tabController.index > 0) tabPage.tabController.index--;
            // tabPage.tabKey.currentState?.setTabIndex(tabPage.tabController.index);
            // widget.pageParam.tabChangeEnable = false;
            // if(tabPage.tabController.index > 0){
            //   tabPage.tabController.animateTo(
            //       tabPage.tabController.index - 1,
            //       // duration: widget.animationDuration ,
            //       curve: widget.animationCurve);
            // }
            // tabPage.tabController.animateTo(
            //     tabPage.tabController.index,
            //     duration: const Duration(milliseconds: 1000),
            //     curve: Curves.easeInOutCubic);
          }
          // widget.pageParam.tabChangeEnable = false;
          // tabPage.setParam(PageParam(tabChangeEnable: false));
        }
        setState(() => currentPage = newPage); // để cập nhật phần expandable

      }else{
        //khi currentPage == newPage tức animation hoàn tất (hàm round của newPage)
        // widget.pageParam.tabChangeEnable = true;
        // tabPage.setParam(PageParam(tabChangeEnable: true));
      }
    });
  }

  @override
  void dispose() {
    // _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      curve: widget.animationCurve,
      duration: widget.animationDuration,
      tween: Tween<double>(begin: _heights[0], end: _currentHeight),
      builder: (context, value, child) => SizedBox(height: value, child: child),
      child: PageView(
        // không sử dụng swipe của PageView mà dùng của GestureDetector của CustomTabbar
        // physics: NeverScrollableScrollPhysics(),
        controller: widget.pageController,
        children: _sizeReportingChildren
            .asMap() //
            .map((index, child) => MapEntry(index, child))
            .values
            .toList(),

        scrollDirection: widget.pageViewParam.scrollDirection,
        reverse: widget.pageViewParam.reverse,
        physics: widget.pageViewParam.physics,
        pageSnapping: widget.pageViewParam.pageSnapping,
        onPageChanged: widget.pageViewParam.onPageChanged,
        dragStartBehavior: widget.pageViewParam.dragStartBehavior,
        allowImplicitScrolling: widget.pageViewParam.allowImplicitScrolling,
        restorationId: widget.pageViewParam.restorationId,
        clipBehavior: widget.pageViewParam.clipBehavior,
        scrollBehavior: widget.pageViewParam.scrollBehavior,
        padEnds: widget.pageViewParam.padEnds,
      ),
    );
  }

  List<Widget> get _sizeReportingChildren => widget.children
      .asMap() //
      .map(
        (index, child) => MapEntry(
      index,
      OverflowBox(
        //needed, so that parent won't impose its constraints on the children, thus skewing the measurement results.
        minHeight: 0,
        maxHeight: double.infinity,
        alignment: Alignment.topCenter,
        child: SizeReportingWidget(
          onSizeChange: (size) =>
              setState(() => _heights[index] = size.height),
          // child: Align(child: child), // luôn canh giữa
          child: child,
        ),
      ),
    ),
  )
      .values
      .toList();

}