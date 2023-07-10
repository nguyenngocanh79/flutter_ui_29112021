import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_29112021/common/constant.dart';
import 'package:flutter_ui_29112021/home/drawer_custom.dart';
import 'package:flutter_ui_29112021/home/page_route_custom.dart';
import 'package:flutter_ui_29112021/sign_in/version.dart';

import '../flash/loading_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:developer' as developer;
const Color colorGreen = Color.fromARGB(255, 0, 180, 109);

class HomeScreen extends StatefulWidget {

  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  var isPassVisible = true;

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  List itemList = ["Quản lý sân", "Đặt sân", "Tìm sân", "Tìm HLV", "Tìm đối thủ", ];

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Sign In Page'),
        // ),
        body: Container(
          color: Colors.black,
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [
          //       Colors.blue,
          //       Colors.blue,
          //       Color(0xFF140037),
          //       Colors.black,
          //
          //     ],
          //     stops: [0.0, 0.25, 0.75, 1.0],
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //   ),
          // ),
          child: Stack(
            children: [
              Column(
                children: [
                  // Expanded(
                  //   flex: 2,
                  //   // child: Image.network("https://erp.pecc5.vn/web/binary/company_logo",
                  //   child: Image.asset(
                  //     "assets/images/Xportex_logo_snail_cloud.png",
                  //     width: MediaQuery.of(context).size.width * 3.5 / 5,
                  //   ),
                  // ),
                  _buildHomeAppBar(),
                  SizedBox(height: 20,),

                  Expanded(
                    child: _buildContent(),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginTextField() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: TextField(
        maxLines: 1,
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          // fillColor: Color(0xFF39E8C3),
          filled: true,
          hintText: "Email",
          contentPadding: const EdgeInsets.only(left: 5, top: 9.0, bottom: 9.0),
          isDense: true,
          labelStyle: TextStyle(color: Colors.blue),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0, color: Colors.black12)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0, color: Colors.black12)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0, color: Colors.black12)),
          prefixIcon:
          Icon(Icons.email, color: Theme.of(context).colorScheme.primary
            // color: Colors.blue
          ),
        ),
      ),
    );
  }


  Widget _buildHomeAppBar(){
    return Column(
      children: [
        Container(
          // color: Colors.red,
          width: MediaQuery.of(context).size.width,
          // height: 50,
          child: Stack(
            children: [
              Positioned(
                  left: 0, top: 0,
                  child: IconButton(
                    icon: Image.asset("assets/images/menu_02-02.png",width: 22,),
                    onPressed: (){
                      Navigator.of(context).push(
                          CustomPageRoute(child: DrawerPage(), direction: AxisDirection.right)
                      );
                    },
                  )
              ),
              Center(
                child: Image.asset(
                  "assets/images/Xportex_logo_full_name.png",
                  width: MediaQuery.of(context).size.width * 3 / 10,
                ),
              ),
              // Positioned(
              //     right: 0, top: 0,
              //     child: IconButton(onPressed: (){}, icon: Icon(Icons.email, color: Color.fromARGB(255, 0, 180, 109),))
              // ),
              Positioned(
                  right: 0, top: 0,
                  child: IconButton(onPressed: (){}, icon: Image.asset("assets/images/email-01.png", width: 22,))
              ),
            ],
          ),
          // decoration: BoxDecoration(
          //   border: Border(
          //     bottom: BorderSide(
          //       color: Colors.white,
          //       style: BorderStyle.solid,
          //       width: 1.0,
          //     ),
          //   ),
          // ),
          // child: CustomPaint(
          //   painter: DotBorderPainter(),
          //   child: Stack(
          //     children: [
          //       Positioned(
          //         left: 0, top: 0,
          //         child: IconButton(
          //           icon: Image.asset("assets/images/menu_02-02.png",width: 22,),
          //           onPressed: (){
          //             Navigator.of(context).push(
          //               CustomPageRoute(child: DrawerPage(), direction: AxisDirection.right)
          //             );
          //           },
          //         )
          //       ),
          //       Center(
          //         child: Image.asset(
          //           "assets/images/Xportex_logo_full_name.png",
          //           width: MediaQuery.of(context).size.width * 3 / 10,
          //         ),
          //       ),
          //       // Positioned(
          //       //     right: 0, top: 0,
          //       //     child: IconButton(onPressed: (){}, icon: Icon(Icons.email, color: Color.fromARGB(255, 0, 180, 109),))
          //       // ),
          //       Positioned(
          //           right: 0, top: 0,
          //           child: IconButton(onPressed: (){}, icon: Image.asset("assets/images/email-01.png", width: 22,))
          //       ),
          //     ],
          //   ),
          // ),
        ),
        _buildAppbarSeparation()
      ],
    );
  }

  Widget _buildAppbarSeparation(){
    double strokeHeight = 0.5;
    double lineWidth = 1.6/5;
    return Container(
      // color: Colors.white,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _drawLine(width: MediaQuery.of(context).size.width*lineWidth, height: strokeHeight),
              Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*(1-2*lineWidth)),
                      child: Center(child: Text("Sport is easy!", style: TextStyle(color: colorGreen, height: 1.2,), overflow: TextOverflow.ellipsis, maxLines: 1,)))
              ),
              _drawLine(width: MediaQuery.of(context).size.width*lineWidth, height: strokeHeight),
            ],
          ),

          // Row(
          //   children: [
          //     _drawLine(width: MediaQuery.of(context).size.width*1/3 + 5, height: strokeHeight),
          //     SizedBox(width: MediaQuery.of(context).size.width*1/9,),
          //     _drawLine(width: MediaQuery.of(context).size.width*5/9 - 5, height: strokeHeight),
          //   ],
          // )
        ],
      ),
    );
  }

  Widget _drawLine({required double width, required double height,}){
    return Container(
      width: width, height: height,
      color: Colors.green,
    );
  }

  Widget _buildContent(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          _buildGridView(menuList: itemList),
          // VersionWidget(),
          // ...... other list children.
        ],
      ),

      // child: ListView(
      //   children: [
      //     _buildGridView(menuList: itemList),
      //     VersionWidget(),
      //   ],
      // ),
    );
  }

  Widget _buildGridView({required List menuList}){

    return GridView.count(
      childAspectRatio: 4/2,
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 20,
      physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
      shrinkWrap: true, // You won't see infinite size error
      children: <Widget>[
        ...itemList.map((e) => _buildGridItem(index: itemList.indexOf(e))).toList()
      ],
    );
  }

  Widget _buildGridItem({required int index}){
    String fileName = _indexToName(index);
    return Container(
      // width: 200, height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorDarkBlue,
            Colors.black,
          ],
          stops: [0.0,0.4],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
        ),
        border: Border.all(width: 0.5, color: colorGreen),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(fileName,width: 40,),
              ),
              Text(itemList[index].toString()),
            ],
          )
      ),
    );
  }

  String _indexToName(int index){
    switch(index){
      case 0:
        return "assets/images/court_managing-05.png";
      case 1:
        return "assets/images/reserve-03.png";
      case 2:
        return "assets/images/search_position-04.png";
      case 3:
        return "assets/images/coach-06.png";
      case 4:
        return "assets/images/competitor-07.png";
      default:
        return "assets/images/reserve-03.png";
    }
  }
}

class DotBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final spaceBetweenDots = 5.0;
    final dotRadius = 2.0;
    final dotCount = size.width ~/ (dotRadius * 2 + spaceBetweenDots);

    final dotOffsetX = (size.width - (dotCount * (dotRadius * 2 + spaceBetweenDots))) / 2;

    for (int i = 0; i < dotCount; i++) {
      final dotX = dotOffsetX + i * (dotRadius * 2 + spaceBetweenDots);
      final dotCenter = Offset(dotX, size.height - dotRadius);
      canvas.drawCircle(dotCenter, dotRadius, paint);
    }
  }

  @override
  bool shouldRepaint(DotBorderPainter oldPainter) => false;
}

class HeartBorder extends ShapeBorder {
  final Color color;
  final double strokeWidth;

  const HeartBorder({
    this.color = Colors.red,
    this.strokeWidth = 2.0,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    final halfWidth = rect.width / 2;
    final bottomHeight = rect.height / 2;
    final topHeight = rect.height * 0.4;

    path.moveTo(rect.left, rect.top + bottomHeight);
    path.quadraticBezierTo(rect.left, rect.top + topHeight, rect.left + halfWidth, rect.top);
    path.quadraticBezierTo(rect.right, rect.top + topHeight, rect.right, rect.top + bottomHeight);
    path.quadraticBezierTo(rect.right, rect.bottom, rect.left + halfWidth, rect.bottom - strokeWidth / 2);
    path.quadraticBezierTo(rect.left, rect.bottom, rect.left, rect.top + bottomHeight);

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final path = getOuterPath(rect);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return HeartBorder(
      color: color,
      strokeWidth: strokeWidth * t,
    );
  }
}