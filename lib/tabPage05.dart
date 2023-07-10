import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui_29112021/CustomLongPressDraggable.dart';
import 'package:flutter_ui_29112021/animatedTabbar.dart';
import 'package:flutter_ui_29112021/color_change.dart';
import 'package:flutter_ui_29112021/custom_tabbar.dart';
import 'package:flutter_ui_29112021/dragTargetPage.dart';
import 'package:flutter_ui_29112021/expandablePageView.dart';
import 'package:flutter_ui_29112021/log_widget.dart';
import 'package:flutter_ui_29112021/page_view.dart';

import 'customTabbarParam.dart';
import 'custom_theme.dart';

//https://stackoverflow.com/questions/52547731/tabbarview-with-variable-height-inside-a-listview
class TabPage05 extends StatefulWidget {

  @override
  TabPage05State createState() => TabPage05State();
}

class TabPage05State extends State<TabPage05> with SingleTickerProviderStateMixin {

  MaterialColor color = Colors.grey;
  late LogWidget _logWidget;
  // List<List<Widget>> pageContent = [
  //   [Text("Page 01, Text 01"), Text("Page 01, Text 02"), Text("Page 01, Text 03"), Text("Page 01, Text 04"),],
  //   [Text("Page 02, Text 01"), Text("Page 02, Text 02"), Text("Page 02, Text 03"), Text("Page 02, Text 04"),],
  //   [Text("Page 03, Text 01"), Text("Page 03, Text 02"), Text("Page 03, Text 03"), Text("Page 03, Text 04"),],
  //   [Text("Page 04, Text 01"), Text("Page 04, Text 02"), Text("Page 04, Text 03"), Text("Page 04, Text 04"),],
  //   [Text("Page 05, Text 01"), Text("Page 05, Text 02"), Text("Page 05, Text 03"), Text("Page 05, Text 04"),],
  // ];
  List<List<String>> pageContent = [
    ["Page 00, Text 01", "Page 00, Text 02", "Page 00, Text 03", "Page 00, Text 04"],
    ["Page 01, Text 01", "Page 01, Text 02", "Page 01, Text 03", "Page 01, Text 04"],
    ["Page 02, Text 01", "Page 02, Text 02", "Page 02, Text 03", "Page 02, Text 04"],
    ["Page 03, Text 01", "Page 03, Text 02", "Page 03, Text 03", "Page 03, Text 04"],
    ["Page 04, Text 01", "Page 04, Text 02", "Page 04, Text 03", "Page 04, Text 04"],
  ];
  List<List<ListItem>> itemList = [];
  List<List<Widget>> pageCardContent = [];
  // final GlobalKey<LogWidgetState> _logKey = GlobalKey<LogWidgetState>();
  // final GlobalKey<AnimatedTabBarState> tabKey = GlobalKey<AnimatedTabBarState>();
  // final GlobalKey<ExpandablePageViewState> _pageKey = GlobalKey<ExpandablePageViewState>();

  final List<Tab> myTabs = [
    Tab(text: 'one one one', ),
    Tab(text: 'two two two'),
    Tab(text: 'three three three'),
    Tab(text: 'four four four'),
    Tab(text: 'five five five'),
  ];
  // final List<Widget> myPages = [
  //   Text('first tab'),
  //   Container(
  //     width: 360,
  //     decoration: BoxDecoration(
  //       color: Colors.green
  //     ),
  //     // color: Colors.red,
  //     child: Column(
  //       children: [
  //         Text('second tab'),
  //         ...List.generate(10, (index) => Text('line: $index'))
  //       ],
  //     ),
  //   ),
  //   Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text('third tab'),
  //       ...List.generate(50, (index) => Text('line: $index'))
  //     ],
  //   ),
  //   Container(
  //     width: 360,
  //     decoration: BoxDecoration(
  //         color: Colors.green
  //     ),
  //     child: Column(
  //       children: [
  //         Text('fourth tab'),
  //         ...List.generate(20, (index) => Text('line: $index'))
  //       ],
  //     ),
  //   ),
  //   Column(
  //     children: [
  //       Text('fifth tab'),
  //       ...List.generate(40, (index) => Text('line: $index'))
  //     ],
  //   ),
  // ];

  List<Widget> myPages = [];
  // late TabController tabController;
  // late PageController pageController;
  final GlobalKey<CustomTabbarState> tabKey = GlobalKey<CustomTabbarState>();
  final GlobalKey _draggableKey = GlobalKey();
  int startIndex = 0;


  @override
  void dispose() {
    // tabController.dispose();
    // pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // _logWidget = LogWidget(key: _logKey, color: color,);

    // tabController = TabController(length: myTabs.length, vsync: this);
    // tabController.addListener(_handleTabSelection);
    //
    // pageController = PageController();
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
    itemList = pageContent.map((e) => e.map((e) => ListItem(color: getColor(e), name: e)).toList()).toList();


  }

  // _handleTabSelection() {
  //   if (tabController.indexIsChanging) {
  //     // _tabController.animateTo(_tabController.index,duration: Duration(milliseconds: 100));
  //     // Chỉ có tác dụng khi click
  //     // int currentPage = _pageKey.currentState?.currentPage??0;
  //     pageController.animateToPage(
  //         tabController.index,
  //         duration: const Duration(milliseconds: 300),
  //         curve: Curves.easeInOutCubic
  //     );
  //     // setState(() {});
  //   }

  // }

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
    pageCardContent = itemList.map((e) => e.map((e) => CustomLongPressDraggable<ListItem>(
      tabKey: tabKey,
      numOfTabs: itemList.length,
      longPressDraggableParam: LongPressDraggableParam<ListItem>(
        maxSimultaneousDrags: 1, // bằng 0 sẽ disable drag
        data: e,
        dragAnchorStrategy: pointerDragAnchorStrategy,
        // onDragUpdate: (details){
        //   // print(details.globalPosition.dx.toString());
        //   // if(details.globalPosition.dx + 50> MediaQuery.of(context).size.width){
        //   //   tabKey.currentState?.movetabbar(2);
        //   // }
        // },
        childWhenDragging: Card(child: Container(
            width: 360,
            height: 60,
            alignment: Alignment.center,
            color: Colors.purple,
            child: Text(e.name)
        ),),
        // feedback: Card(child: Container(
        //     width: 360,
        //     height: 60,
        //     alignment: Alignment.center,
        //     color: Colors.white30,
        //     child: Text(e.name)
        // ),),
        feedback: DraggingListItem(
          dragKey: _draggableKey,
          // photoProvider: const NetworkImage('https://flutter'
          //   '.dev/docs/cookbook/img-files/effects/split-check/Avatar3.jpg'),
          // photoProvider: AssetImage("assets/icons/calculator_icon_8179.png"),
          item: Card(child: Container(
              width: 360,
              height: 60,
              alignment: Alignment.center,
              color: Colors.white30,
              child: Text(e.name)
          ),),
        ),
        child: Card(child: Container(
            width: 360,
            height: 60,
            alignment: Alignment.center,
            color: e.color,
            child: Text(e.name)
        ),),
        onDragStarted: (){
          startIndex = tabKey.currentState?.tabController.index??0;
        },
        onDragEnd: (details){
          print("Drag ended");
        },
        onDraggableCanceled: (velocity, offset){
          print("Drag canceled");
        },
      ),

    )
    ).toList()).toList();

    // for(var page in pageCardContent){
    //   myPages.add(Column(children: item,));
    // }
    myPages = [];
    for(int i = 0; i < pageCardContent.length; i++){
      myPages.add(
          DragTargetPage<ListItem>(
            child: Column(children: pageCardContent[i],),
            onAccept: (item){
              setState(() {
                if(startIndex != i){
                  itemList[startIndex].remove(item);
                  itemList[i].add(item);
                }
              });
            },
          )
      );
    }

    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: (){
              var randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
              // _key.currentState?.setColor(color); // Không làm kiểu này vì nếu widget ở cuối list không hiển thị sẽ không được gọi
              setState(() {
                color = randomColor;
              });
            },
            child: Text("change color")
          ),
          Expanded(
            child: CustomTabbar(
              key: tabKey,
              tabs: myTabs,
              pages: myPages,
              trailingList: [
                LogWidget(color: color,)
              ],
              animationDuration: Duration(milliseconds: 500),
              animationCurve: Curves.easeInOutCubic,
              tabBarParam: TabBarParam(
                isScrollable: true,
                indicator: BoxDecoration(
                    color: colorChangeLight(color: primaryColorCustom, lightnessDiff: 0.1)
                ),
                // labelColor: Colors.white,
                // unselectedLabelColor: Colors.white60,

                color: Theme.of(context).colorScheme.primary,
                elevation: 0.5,
              ),
              pageViewParam: PageViewParam(
                // không sử dụng swipe của PageView mà dùng của GestureDetector của CustomTabbar
                physics: NeverScrollableScrollPhysics(),
                pageSnapping: false
              ),
            ),
          ),
        ]
      ),
    );
  }
}

class ListItem{
  String name;
  Color color;
  ListItem({required this.color, required this.name});
}

class DraggingListItem extends StatelessWidget {
   DraggingListItem({
  Key? key,
  required this.dragKey,
  this.photoProvider,
    this.item,
     this.imageWidth = 150, this.imageHeight = 150
  }):super(key: key){
    // assert(!(photoProvider != null && item != null));
    assert((photoProvider == null) ^ (item == null) );

  }

  final GlobalKey dragKey;
  final ImageProvider? photoProvider;
  final Widget? item;
  final double imageHeight;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: photoProvider != null ? ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: imageHeight,
          width: imageWidth,
          child: Opacity(
            opacity: 0.85,
            child: Image(
              image: photoProvider!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ) : Container(
        key: dragKey,
        child: Opacity(
            opacity: 0.85,
            child: item
        ),
      ),
    );
  }
}

Color getColor(String name){
  switch(name.substring(5,7,)){
    case "00":
      return Colors.red;
    case "01":
      return Colors.yellow;
    case "02":
      return Colors.blue;
    case "03":
      return Colors.grey;
    case "04":
      return Colors.orange;
    default:
      return Colors.white;
  }
}