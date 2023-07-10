import 'package:flutter/material.dart';
import 'package:flutter_ui_29112021/sign_in/version.dart';

import '../common/constant.dart';

const double circleRadius = 25;

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState  extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              _buildAppBar(),

              Expanded(
                  child: _buildContent()
              ),
              VersionWidget()
              // _buildSignOut(),
              // Expanded(
              //   child: Align(
              //     alignment: Alignment.bottomCenter,
              //     child: VersionWidget(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      // decoration: BoxDecoration(
      //   border: Border(
      //     bottom: BorderSide(
      //       color: Colors.white,
      //       style: BorderStyle.solid,
      //       width: 1.0,
      //     ),
      //   ),
      // ),
      child: Stack(
        children: [
          Positioned(
              left: 0, top: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: colorGreen,) ,
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
          ),

          Center(
            child: Text("Settings"),
          ),
          // Positioned(
          //     right: 0, top: 0,
          //     child: IconButton(onPressed: (){}, icon: Icon(Icons.email, color: Color.fromARGB(255, 0, 180, 109),))
          // ),
          // Positioned(
          //     right: 0, top: 0,
          //     child: IconButton(onPressed: (){}, icon: Image.asset("assets/images/email-01.png", width: 22,))
          // ),
        ],
      ),
    );
  }

  Widget _buildContent(){
    double boxWidth = MediaQuery.of(context).size.width*0.95;
    double innerBoxWidth = boxWidth - 1;
    return Stack(
      children: [
        Container(
          width: boxWidth,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                colorGreen,
                Colors.black,
              ],
              stops: [0.0, 0.7,],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(10),
          )
        ),
        Positioned.fill(
          top: 0.5,
          left: 0.5,
          right: 0.5,
          child: Container(
            width: innerBoxWidth,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  colorDarkBlue,
                  Colors.black,
                ],
                stops: [0.0, 0.6,],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildIntro(),
                _buildProfile(),
                _buildChangePass(),
                _buildChangeLang(),
                _buildSignOut(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildIntro(){
    double boxWidth = MediaQuery.of(context).size.width*0.95;
    double innerBoxWidth = boxWidth - 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/settings-01.png",width: innerBoxWidth,)
            ),
            Positioned(
              bottom: -circleRadius,
              left: innerBoxWidth/2 - circleRadius,
              child: Container(
                width: circleRadius * 2, height: circleRadius * 2,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  shape: BoxShape.circle
                ),
                child: Center(child: Icon(Icons.person, size: 40,)),
              ),
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(circleRadius),
              //     child: Icon(Icons.person)
              // ),
            )
          ],
        ),
        SizedBox(height: 40,),
        Text("Hello, NGUYỄN NGỌC ANH"),
        Text("0908995501", style: TextStyle(color: Colors.grey),),

      ],
    );
  }

  Widget _buildProfile(){
    return ListTile(
      leading: Icon(Icons.person, color: colorGreen,),
      title: Text("User profile"),
    );
  }

  Widget _buildChangeLang(){
    return ListTile(
      leading: Icon(Icons.language , color: colorGreen,),
      title: Text("Change language"),
    );
  }

  Widget _buildChangePass(){
    return ListTile(
      leading: Icon(Icons.lock, color: colorGreen,),
      title: Text("Change password"),
    );
  }

  Widget _buildSignOut(){
    return ListTile(
      leading: Icon(Icons.logout, color: colorGreen,),
      title: Text("Sign out"),
    );
  }
}
