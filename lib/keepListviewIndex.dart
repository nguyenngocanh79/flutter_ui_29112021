// import 'package:flutter/material.dart';
// import 'package:flutter_ui_29112021/statefulList.dart';
//
// class DebugUiPage extends StatefulWidget {
//   DebugUiPage({Key? key}) : super(key: key);
//
//   @override
//   _DebugUiPageState createState() => new _DebugUiPageState();
// }
//
// class _DebugUiPageState extends State<DebugUiPage>
//     with SingleTickerProviderStateMixin {
//   late PageController _pageController;
//   int _page = 0;
//   late Widget _list;
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = new PageController();
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_list == null) {
//       _list = new StatefulListView(100, getBuilder);
//     }
//     return new Scaffold(
//         appBar: new AppBar(
//             title: new Text("Hello")
//         ),
//         bottomNavigationBar: new BottomNavigationBar(
//           items: [
//             new BottomNavigationBarItem(
//                 icon: new Icon(Icons.map),
//                 title: new Text("Lorem")
//             ),
//             new BottomNavigationBarItem(
//                 icon: new Icon(Icons.pin_drop),
//                 title: new Text("Borem")
//             ),
//             new BottomNavigationBarItem(
//                 icon: new Icon(Icons.people),
//                 title: new Text("Ipsum")
//             )
//           ],
//           currentIndex: _page,
//           onTap: navigationTapped,
//         ),
//         body: new PageView(
//             onPageChanged: onPageChanged,
//             controller: _pageController,
//             children: <Widget>[
//               _list,
//               new Container(color: Colors.yellow),
//               new Container(color: Colors.blue)
//             ]
//         )
//     );
//   }
//
//   void navigationTapped(int index) {
//     _pageController.animateToPage(
//         index,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.ease
//     );
//   }
//
//   void onPageChanged(int value) {
//     setState(() {
//       this._page = value;
//     });
//   }
// }
//
//
// Widget getBuilder(BuildContext context, int index) {
//   return new Card(
//       child: new Container(
//           padding: new EdgeInsets.all(16.0),
//           child: new Text("Item value $index")
//       )
//   );
// }