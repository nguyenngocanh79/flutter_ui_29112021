import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_29112021/color_change.dart';
import 'package:flutter_ui_29112021/log_widget.dart';
import 'package:flutter_ui_29112021/swipe_detector.dart';

import 'custom_theme.dart';

class TabPage04 extends StatefulWidget {
  @override
  _TabPage04State createState() => _TabPage04State();
}

class _TabPage04State extends State<TabPage04> with SingleTickerProviderStateMixin {
  MaterialColor color = Colors.red;
  late LogWidget _logWidget;
  final GlobalKey<LogWidgetState> _key = GlobalKey<LogWidgetState>();

  final List<Widget> myTabs = [
    Tab(text: 'one'),
    Tab(text: 'two'),
    Tab(text: 'three'),
  ];

  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _logWidget = LogWidget(key: _key, color: color,);

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);

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
    if (_tabController.indexIsChanging) {
      // _tabController.animateTo(_tabController.index,duration: Duration(milliseconds: 100));

      setState(() {});
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
      body: SwipeDetector(
        onSwipeUp: () {
          // Không tác dụng do có ListView che
            print("Swipe Up");
          },
          onSwipeDown: () {
            // Không tác dụng do có ListView che
            print("Swipe Down");
          },
          onSwipeLeft: () {
            // Page forwards
            if(_tabController.index < _tabController.length - 1) _tabController.index++;
            setState(() {});
            print("Swipe Left");
          },
          onSwipeRight: () {
            // Page backwards
            if(_tabController.index > 0) _tabController.index--;
            setState(() {});
            print("Swipe Right");
          },
        child: ListView(
          children: <Widget>[
            ElevatedButton(
                onPressed: (){
                  var randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
                  // _key.currentState?.setColor(color);
                  setState(() {
                    color = randomColor;
                  });
                },
                child: Text("change color")
            ),
            TabBar(
              indicator: BoxDecoration(
                  color: colorChangeLight(color: primaryColorCustom, lightnessDiff: 0.1)
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.redAccent,
              controller: _tabController,
              tabs: myTabs,
            ),
            Center(
              child: [
                Text('first tab'),
                Column(
                  children: [
                    Text('second tab'),
                    ...List.generate(10, (index) => Text('line: $index'))
                  ],
                ),
                Column(
                  children: [
                    Text('third tab'),
                    ...List.generate(50, (index) => Text('line: $index'))
                  ],
                ),
              ][_tabController.index],
            ),
            LogWidget(color: color,),
            // _listItem(),
          ],
        ),
      ),
    );
  }
}