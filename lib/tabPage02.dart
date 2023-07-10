import 'package:flutter/material.dart';

class TabPage02 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TabPage02> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: TabBar(
                controller: tabController,
                labelColor: Colors.redAccent,
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Text(
                      "Tab 1",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Tab 2",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: Column(
          children: [
            // Text("ABC"),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  /// Each content from each tab will have a dynamic height
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
                  ),
                  Container(child: Text("Page 02"),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}