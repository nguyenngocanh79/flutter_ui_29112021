import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_29112021/log_widget.dart';

class RIKeys {
  static final riKey1 = GlobalKey<LogWidgetState>();
  static final riKey2 = const Key('__RIKEY2__');
  static final riKey3 = const Key('__RIKEY3__');
}

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  MaterialColor color = Colors.red;
  late LogWidget _logWidget;
  final GlobalKey<LogWidgetState> _key = GlobalKey<LogWidgetState>();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _logWidget = LogWidget(color: color,);
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _logWidget = LogWidget(color: color,);
  }
  @override
  void dispose() {
    _key.currentState!.dispose(); // 👈 dispose the key here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _logWidget = LogWidget(color: color,);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                PreferredSize(
                  child: SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                      sliver: SliverAppBar(
                        floating: true,
                        snap: true,
                        title: Text("Tabbar Test"),
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(kTextTabBarHeight + 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // middle
                              ElevatedButton(
                                  onPressed: (){
                                    var color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

                                    // setState(() {
                                    //   color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
                                    // });
                                    // var randomColor = Random().nextInt(Colors.primaries.length);
                                    _key.currentState?.setColor(color);
                                    // setState(() {
                                    //   _logWidget = LogWidget(color: color,);
                                    // });
                                  },
                                  child: Text("Button")
                              ),
                              // content
                              TabBar(
                                tabs: [
                                  Tab(child: Text("TAB1"),),
                                  Tab(child: Text("TAB2"),),
                                  Tab(child: Text("TAB3"),),
                                ]
                              ),

                            ],
                          ),
                        ),
                      ),
                  ),
                  preferredSize: Size.fromHeight(kToolbarHeight + kTextTabBarHeight + 100),
                ),
              ];
            },
            // body: Column(
            //   children: [
            //
            //     Expanded(
            //       child: TabBarView(
            //           children: [
            //             Text("A"),
            //             Text("B"),
            //             Text("C"),
            //           ]
            //       ),
            //     ),
            //   ],
            // ),
            body: Column(
              children: [
                _logWidget,
                Expanded(
                  child: TabBarView(
                    children: [
                      Column(
                        children: [
                          Text("Tab1 \n" * 20),
                          // _logWidget,
                        ],
                      ),
                      Column(
                        children: [
                          Text("Tab2"),
                          // _logWidget,
                        ],
                      ),
                      ListView(
                        children: [
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A"),
                          Text("A0"),
                          // _logWidget,
                        ],
                      )
                    ],
                  ),
                ),
                _logWidget,
              ],
            ),
          ),
        )
    );
  }
}
