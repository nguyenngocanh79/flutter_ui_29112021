import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui_29112021/animatedTabbar.dart';
import 'package:flutter_ui_29112021/color_change.dart';
import 'package:flutter_ui_29112021/log_widget.dart';
import 'package:flutter_ui_29112021/sizeReportingWidget.dart';
import 'package:flutter_ui_29112021/swipe_detector.dart';
import 'package:flutter_ui_29112021/tabPage03.dart';

import 'customTabbarParam.dart';
import 'expandablePageView2.dart';

const double _kTabHeight = 46.0;
const double _kTextAndIconTabHeight = 72.0;

//https://stackoverflow.com/questions/52547731/tabbarview-with-variable-height-inside-a-listview
class CustomTabbar extends StatefulWidget {
  List<Tab> tabs;
  List<Widget> pages;
  List<Widget>? trailingList;
  Duration animationDuration;
  Curve animationCurve;
  TabBarParam tabBarParam;
  PageViewParam pageViewParam;

  CustomTabbar({
    Key? key,
    required this.tabs,
    required this.pages,
    this.trailingList,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOutCubic,
    this.tabBarParam = const TabBarParam(),
    this.pageViewParam = const PageViewParam(),
  }) : super(key: key);

  static CustomTabbarState getData(BuildContext context){
    return context.findAncestorStateOfType()!;
  }
  @override
  CustomTabbarState createState() => CustomTabbarState();
}

class CustomTabbarState extends State<CustomTabbar> with SingleTickerProviderStateMixin {

  MaterialColor color = Colors.red;
  final GlobalKey<LogWidgetState> _logKey = GlobalKey<LogWidgetState>();
  final GlobalKey<AnimatedTabBarState> tabKey = GlobalKey<AnimatedTabBarState>();
  final GlobalKey<ExpandablePageView2State> _pageKey = GlobalKey<ExpandablePageView2State>();

  late TabController tabController;
  late PageController pageController;

  bool firstTime = true;
  double currentOffset = 0;

  // PageParam pageParam = PageParam();
  //
  // setParam(PageParam newPageParam){
  //   pageParam = newPageParam;
  // }
  //
  // bool _swipeIsInProgress = false;
  // bool _tapIsBeingExecuted = false;
  // int _selectedIndex = 1;
  // int _prevIndex = 1;

  @override
  void dispose() {
    tabController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(
      length: widget.tabs.length, vsync: this,
      animationDuration: widget.animationDuration
    );
    tabController.addListener(_handleTabSelection);
    // tabController.animation?.addListener(() {
    //   if(!tabController.indexIsChanging){
    //     pageController.jumpTo(tabController.index + tabController.offset*MediaQuery.of(context).size.width);
    //
    //   }
    // });
    //
    // tabController.animation?.addListener(() {
    //   if (!_tapIsBeingExecuted &&
    //       !_swipeIsInProgress &&
    //       (tabController.offset >= 0.5 || tabController.offset <= -0.5)) {
    //     // detects if a swipe is being executed. limits set to 0.5 and -0.5 to make sure the swipe gesture triggered
    //     print("swipe  detected");
    //     int newIndex = tabController.offset > 0 ? tabController.index + 1 : tabController.index - 1;
    //     _swipeIsInProgress = true;
    //     _prevIndex = _selectedIndex;
    //     setState(() {
    //       _selectedIndex = newIndex;
    //     });
    //   } else {
    //     if (!_tapIsBeingExecuted &&
    //         _swipeIsInProgress &&
    //         ((tabController.offset < 0.5 && tabController.offset > 0) ||
    //             (tabController.offset > -0.5 && tabController.offset < 0))) {
    //       // detects if a swipe is being reversed. the
    //       print("swipe reverse detected");
    //       _swipeIsInProgress = false;
    //       setState(() {
    //         _selectedIndex = _prevIndex;
    //       });
    //     }
    //   }
    // });
    // tabController.addListener(() {
    //   _swipeIsInProgress = false;
    //   setState(() {
    //     _selectedIndex = tabController.index;
    //   });
    //   if (_tapIsBeingExecuted == true) {
    //     _tapIsBeingExecuted = false;
    //   } else {
    //     if (tabController.indexIsChanging) {
    //       // this is only true when the tab is changed via tap
    //       _tapIsBeingExecuted = true;
    //     }
    //   }
    // });

    pageController = PageController();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    tabController.animation?.addListener(() {
      if(tabController.animation!.isCompleted) {
        firstTime = true;
      }
      if(!tabController.indexIsChanging){
        //chỉ gán 1 lần
        if(firstTime) {
          currentOffset = pageController.offset;
          firstTime = false;
        }
        pageController.jumpTo(currentOffset  + tabController.offset*MediaQuery.of(context).size.width);
      }
    });
  }

  _handleTabSelection() {
    if (tabController.indexIsChanging ) {
      // Chỉ có tác dụng khi click hay animateTo
      // pageController.jumpTo(tabController.index*360 + 100);
      // pageController.jumpToPage(tabController.index);
      pageController.animateToPage(
          tabController.index,
          duration: widget.animationDuration,
          curve: widget.animationCurve
      );
    }

  }

  _listItem() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.blueAccent,
        ),
      ),
      height: 120,
      child: Center(
        child: Text('Log Widget', style: TextStyle(fontSize: 20.0)),
      ),
    );
  }

  void movetabbar(int value){
    tabController.animateTo(value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onSwipeLeft: (){
      //   int currentPage = _pageKey.currentState?.currentPage??0;
      //   if(currentPage < widget.pages.length - 1 ) {
      //     // pageController.animateToPage(
      //     //     currentPage + 1,
      //     //     duration: widget.animationDuration,
      //     //     curve: widget.animationCurve
      //     // );
      //     tabController.animateTo(
      //         currentPage + 1,
      //         // duration: widget.animationDuration,
      //         curve: widget.animationCurve);
      //   }
      // },
      // onSwipeRight: (){
      //   int currentPage = _pageKey.currentState?.currentPage??0;
      //   if(currentPage > 0){
      //     // pageController.animateToPage(
      //     //     currentPage - 1,
      //     //     duration: widget.animationDuration,
      //     //     curve: widget.animationCurve
      //     // );
      //     tabController.animateTo(
      //         currentPage - 1,
      //         // duration: widget.animationDuration,
      //         curve: widget.animationCurve);
      //   }
      // },
      // onHorizontalDrag: (dragDetails){
      //   // print(dragDetails.delta.dx.toString() + "AND" + dragDetails.delta.distance.toString());
      // },
      onLongPress: (){
      },
      onHorizontalDragUpdate: (details) {
        int currentPage = _pageKey.currentState?.currentPage??0;
        double sensitivity = 4;
        if(details.delta.dx.abs() < sensitivity){
          // sensitivity để tránh trường hợp quét mạnh nhưng vẫn chạy
          double dxOffset = details.delta.dx/MediaQuery.of(context).size.width;
          if(currentPage == 0 ){
            // Tab đầu tiên, chỉ thay đổi offset khi kết quả tabController.offset -= dxOffset > 0
            if(tabController.offset - dxOffset > 0) {
              if(!tabController.indexIsChanging) tabController.offset -= dxOffset;
            }
          }else if(currentPage == widget.pages.length - 1 ){
            // Tab cuối cùng, chỉ thay đổi offset khi khi kết quả tabController.offset -= dxOffset <>> 0
            if(tabController.offset - dxOffset < 0){
              if(!tabController.indexIsChanging) tabController.offset -= dxOffset;
            }
          }else{
            if(!tabController.indexIsChanging) tabController.offset -= dxOffset;
          }
        }

    },
      onHorizontalDragEnd: (dragEndDetails) {
        // int currentPage = _pageKey.currentState?.currentPage??0;
        // int currentPage = pageController.page?.toInt()??0;
        int currentPage = tabController.index;
        if(dragEndDetails.primaryVelocity == 0){
          // tabController.animateTo(tabController.offset.round(),curve: widget.animationCurve);
          if((tabController.offset).abs() < 0.5) {
            tabController.offset = 0;
          }else{
            tabController.animateTo(currentPage + tabController.offset.round(),curve: widget.animationCurve);
          }
        }
        if (dragEndDetails.primaryVelocity != null && dragEndDetails.primaryVelocity! < 0) {
          // Page forwards
          if(currentPage < widget.pages.length - 1 ){
            // Nếu không phải tab cuối
            tabController.animateTo(
                currentPage + 1,
                // duration: widget.animationDuration,
                curve: widget.animationCurve);
          }else{
            // Nếu là tab cuối
            tabController.offset = 0;
          }
        } else if (dragEndDetails.primaryVelocity != null && dragEndDetails.primaryVelocity! > 0) {
          // Page backwards
          if(currentPage > 0){
            // Nếu không phải tab đầu
            tabController.animateTo(
                currentPage - 1,
                // duration: widget.animationDuration,
                curve: widget.animationCurve);
          }else{
            // Nếu là tab đầu
            tabController.offset = 0;
          }
        }
      },
      // Có thể là Column, còn nếu là Listview thì phải có shrinkWrap và physics
      child: ListView(
        // shrinkWrap: true,
        // physics: ClampingScrollPhysics(),
        // mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // ElevatedButton(
          //     onPressed: (){
          //       var randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
          //       // _key.currentState?.setColor(color); // Không làm kiểu này vì nếu widget ở cuối list không hiển thị sẽ không được gọi
          //       setState(() {
          //         color = randomColor;
          //       });
          //     },
          //     child: Text("change color")
          // ),
          // AnimatedTabBar(
          //   key: tabKey,
          //   tabs: myTabs,
          //   controller: tabController,
          //   color: Colors.yellow,
          // ),
          Material(
            type: widget.tabBarParam.type,
            color: widget.tabBarParam.color,
            elevation: widget.tabBarParam.elevation,
            shadowColor: widget.tabBarParam.shadowColor,
            surfaceTintColor: widget.tabBarParam.surfaceTintColor,
            textStyle: widget.tabBarParam.textStyle,
            borderRadius: widget.tabBarParam.borderRadius,
            shape: widget.tabBarParam.shape,
            borderOnForeground: widget.tabBarParam.borderOnForeground,
            clipBehavior: widget.tabBarParam.clipBehavior,
            animationDuration: widget.tabBarParam.animationDuration,
            child: TabBar(
              key: tabKey,
              controller: tabController,
              tabs: widget.tabs,
              isScrollable: widget.tabBarParam.isScrollable,
              padding: widget.tabBarParam.padding,
              indicatorColor: widget.tabBarParam.indicatorColor,
              automaticIndicatorColorAdjustment: widget.tabBarParam.automaticIndicatorColorAdjustment,
              indicatorWeight: widget.tabBarParam.indicatorWeight,
              indicatorPadding: widget.tabBarParam.indicatorPadding,
              indicator: widget.tabBarParam.indicator,
              indicatorSize: widget.tabBarParam.indicatorSize,
              labelColor: widget.tabBarParam.labelColor,
              labelStyle: widget.tabBarParam.labelStyle,
              labelPadding: widget.tabBarParam.padding,
              unselectedLabelStyle: widget.tabBarParam.unselectedLabelStyle,
              unselectedLabelColor: widget.tabBarParam.unselectedLabelColor,
              dragStartBehavior: widget.tabBarParam.dragStartBehavior,
              overlayColor: widget.tabBarParam.overlayColor,
              mouseCursor: widget.tabBarParam.mouseCursor,
              enableFeedback: widget.tabBarParam.enableFeedback,
              onTap: widget.tabBarParam.onTap,
              physics: widget.tabBarParam.physics,
              splashBorderRadius: widget.tabBarParam.splashBorderRadius,
              splashFactory: widget.tabBarParam.splashFactory,
              // indicator: BoxDecoration(
              //     color: colorChangeLight(color: primaryColorCustom, lightnessDiff: 0.1)
              // ),
              // labelColor: Colors.white,
              // unselectedLabelColor: Colors.redAccent,

            ),
          ),
          ExpandablePageView2(
            key: _pageKey,
            pageController: pageController,
            children: widget.pages,
            animationDuration: widget.animationDuration,
            animationCurve: widget.animationCurve,
            pageViewParam: widget.pageViewParam,

            // pageParam: pageParam,
          ),
          // Center(
          //   child: [
          //     Text('first tab'),
          //     Column(
          //       children: [
          //         Text('second tab'),
          //         ...List.generate(10, (index) => Text('line: $index'))
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         Text('third tab'),
          //         ...List.generate(50, (index) => Text('line: $index'))
          //       ],
          //     ),
          //   ][_tabController.index],
          // ),
          ...widget.trailingList??[],
          // LogWidget(color: color,),
          // _listItem(),
        ],
      ),
    );
  }
}



//chưa dùng
class PageParam{
  bool tabChangeEnable;
  PageParam({this.tabChangeEnable = true});
}

