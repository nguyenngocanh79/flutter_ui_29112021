import 'package:flutter/material.dart';
import 'package:flutter_ui_29112021/sizeReportingWidget.dart';
import 'package:flutter_ui_29112021/tabPage03.dart';

//https://stackoverflow.com/questions/54522980/flutter-adjust-height-of-pageview-horizontal-listview-based-on-current-child
class ExpandablePageView extends StatefulWidget {
  PageController pageController;
  final List<Widget> children;

  ExpandablePageView({
    Key? key,
    required this.pageController,
    required this.children,
  }) : super(key: key);

  @override
  State<ExpandablePageView> createState() => ExpandablePageViewState();
}

class ExpandablePageViewState extends State<ExpandablePageView>
    with TickerProviderStateMixin {
  // late PageController _pageController;
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
        if (currentPage != newPage) {
          TabPage03State tabPage = TabPage03.getData(context);
          if(currentPage < newPage){
            // Moving forward
            if(!tabPage.tabController.indexIsChanging){
              //Nếu KHÔNG là kết quả của click tap hay tabController.animateTo
              // if(tabPage.tabController.index < tabPage.tabController.length - 1) tabPage.tabController.index++;
              // tabPage.tabKey.currentState?.setTabIndex(tabPage.tabController.index);
              if(tabPage.tabController.index < tabPage.tabController.length - 1){
                tabPage.tabController.animateTo(
                    tabPage.tabController.index + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOutCubic);
              }

            }

          }else{
            if(!tabPage.tabController.indexIsChanging){
              // if(tabPage.tabController.index > 0) tabPage.tabController.index--;
              // tabPage.tabKey.currentState?.setTabIndex(tabPage.tabController.index);
              if(tabPage.tabController.index > 0){
                tabPage.tabController.animateTo(
                    tabPage.tabController.index - 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOutCubic);
              }
              // tabPage.tabController.animateTo(
              //     tabPage.tabController.index,
              //     duration: const Duration(milliseconds: 1000),
              //     curve: Curves.easeInOutCubic);
            }

          }
          setState(() => currentPage = newPage);

        }
      });
  }

  //Thêm
  void setPageIndex(int pageIndexToSet){
    final newPage = widget.pageController.page?.round() ?? 0;
    if (currentPage != newPage) {
      setState(() => currentPage = newPage);
    }
  }

  @override
  void dispose() {
    // _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      curve: Curves.easeInOutCubic,
      duration: const Duration(milliseconds: 300),
      tween: Tween<double>(begin: _heights[0], end: _currentHeight),
      builder: (context, value, child) => SizedBox(height: value, child: child),
      child: PageView(
        controller: widget.pageController,
        children: _sizeReportingChildren
            .asMap() //
            .map((index, child) => MapEntry(index, child))
            .values
            .toList(),
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