import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui_29112021/animatedTabbar.dart';
import 'package:flutter_ui_29112021/color_change.dart';
import 'package:flutter_ui_29112021/expandablePageView.dart';
import 'package:flutter_ui_29112021/log_widget.dart';
import 'package:flutter_ui_29112021/page_view.dart';

import 'custom_theme.dart';

//https://stackoverflow.com/questions/52547731/tabbarview-with-variable-height-inside-a-listview
class TabPage03 extends StatefulWidget {
  static TabPage03State getData(BuildContext context){
    return context.findAncestorStateOfType()!;
  }
  @override
  TabPage03State createState() => TabPage03State();
}

class TabPage03State extends State<TabPage03> with SingleTickerProviderStateMixin {

  MaterialColor color = Colors.red;
  late LogWidget _logWidget;
  final GlobalKey<LogWidgetState> _logKey = GlobalKey<LogWidgetState>();
  final GlobalKey<AnimatedTabBarState> tabKey = GlobalKey<AnimatedTabBarState>();
  final GlobalKey<ExpandablePageViewState> _pageKey = GlobalKey<ExpandablePageViewState>();

  final List<Tab> myTabs = [
    Tab(text: 'one', ),
    Tab(text: 'two'),
    Tab(text: 'three'),
    Tab(text: 'four'),
    Tab(text: 'five'),
  ];
  final List<Widget> myPages = [
    Text('first tab'),
    Column(
      children: [
        Text('second tab'),
        ...List.generate(10, (index) => Text('line: $index'))
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('third tab'),
        ...List.generate(50, (index) => Text('line: $index'))
      ],
    ),
    Column(
      children: [
        Text('fourth tab'),
        ...List.generate(20, (index) => Text('line: $index'))
      ],
    ),
    Column(
      children: [
        Text('fifth tab'),
        ...List.generate(40, (index) => Text('line: $index'))
      ],
    ),
  ];

  late TabController tabController;
  late PageController pageController;



  @override
  void dispose() {
    tabController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _logWidget = LogWidget(key: _logKey, color: color,);

    tabController = TabController(length: myTabs.length, vsync: this);
    tabController.addListener(_handleTabSelection);

    pageController = PageController();
    // _tabController.animation?.addListener(() {
    //   if (!_tapIsBeingExecuted &&
    //       !_swipeIsInProgress &&
    //       (_tabController.offset >= 0.5 || _tabController.offset <= -0.5)) {
    //     // detects if a swipe is being executed. limits set to 0.5 and -0.5 to make sure the swipe gesture triggered
    //     print("swipe  detected");
    //     int newIndex = _tabController.offset > 0 ? _tabController.index + 1 : _tabController.index - 1;
    //     _swipeIsInProgress = true;
    //     _prevIndex = _selectedIndex;
    //     setState(() {
    //       _selectedIndex = newIndex;
    //     });
    //   } else {
    //     if (!_tapIsBeingExecuted &&
    //         _swipeIsInProgress &&
    //         ((_tabController.offset < 0.5 && _tabController.offset > 0) ||
    //             (_tabController.offset > -0.5 && _tabController.offset < 0))) {
    //       // detects if a swipe is being reversed. the
    //       print("swipe reverse detected");
    //       _swipeIsInProgress = false;
    //       setState(() {
    //         _selectedIndex = _prevIndex;
    //       });
    //     }
    //   }
    // });
    // _tabController.addListener(() {
    //   _swipeIsInProgress = false;
    //   setState(() {
    //     _selectedIndex = _tabController.index;
    //   });
    //   if (_tapIsBeingExecuted == true) {
    //     _tapIsBeingExecuted = false;
    //   } else {
    //     if (_tabController.indexIsChanging) {
    //       // this is only true when the tab is changed via tap
    //       _tapIsBeingExecuted = true;
    //     }
    //   }
    // });
    super.initState();
  }

  _handleTabSelection() {
    if (tabController.indexIsChanging) {
      // _tabController.animateTo(_tabController.index,duration: Duration(milliseconds: 100));
      // Chỉ có tác dụng khi click
      // int currentPage = _pageKey.currentState?.currentPage??0;
      pageController.animateToPage(
          tabController.index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic
      );
      // setState(() {});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: GestureDetector(
        onHorizontalDragEnd: (dragEndDetails) {
          if (dragEndDetails.primaryVelocity != null && dragEndDetails.primaryVelocity! < 0) {
            // Page forwards
            // if(tabController.index < tabController.length - 1) tabController.index++;
            // tabKey.currentState?.setTabIndex(tabController.index);
            // setState(() {
              int currentPage = _pageKey.currentState?.currentPage??0;
              // _pageController.
              if(currentPage < myPages.length - 1 ){
                pageController.animateToPage(
                    currentPage + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOutCubic
                );
              }

            // });
            // setState(() {});
            // print('Move page forwards');
            // _goForward();
          } else if (dragEndDetails.primaryVelocity != null && dragEndDetails.primaryVelocity! > 0) {
            // Page backwards
            // if(tabController.index > 0) tabController.index--;
            // tabKey.currentState?.setTabIndex(tabController.index);
            int currentPage = _pageKey.currentState?.currentPage??0;
            // _pageController.
            if(currentPage > 0){
              pageController.animateToPage(
                  currentPage - 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutCubic
              );
            }
            // setState(() {});
            // print('Move page backwards');
            // _goBack();
          }
        },
        child: ListView(
          // shrinkWrap: true,
          children: <Widget>[
            ElevatedButton(
                onPressed: (){
                  var randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
                  // _key.currentState?.setColor(color); // Không làm kiểu này vì nếu widget ở cuối list không hiển thị sẽ không được gọi
                  setState(() {
                    color = randomColor;
                    Random random = new Random();
                    int randomNumber = random.nextInt(20);
                    myPages[3] = Column(
                      children: [
                        Text('fourth tab'),
                        ...List.generate(randomNumber, (index) => Text('line: $index'))
                      ],
                    );
                  });
                },
                child: Text("change color")
            ),
            // AnimatedTabBar(
            //   key: tabKey,
            //   tabs: myTabs,
            //   controller: tabController,
            //   color: Colors.yellow,
            // ),
            TabBar(
              key: tabKey,
              isScrollable: true,
              indicator: BoxDecoration(
                  color: colorChangeLight(color: primaryColorCustom, lightnessDiff: 0.1)
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.redAccent,
              controller: tabController,
              tabs: myTabs,
            ),
            ExpandablePageView(
              key: _pageKey,
              pageController: pageController,
              children: myPages,
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
            LogWidget(color: color,),
            // _listItem(),
          ],
        ),
      ),
    );
  }
}