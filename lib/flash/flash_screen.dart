import 'package:flutter/material.dart';
import 'package:flutter_ui_29112021/flash/bouncing_animation.dart';
import 'package:flutter_ui_29112021/flash/flip_animation.dart';
import 'package:flutter_ui_29112021/flash/loading_widget.dart';
import 'package:flutter_ui_29112021/flash/opacity_animation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FlashPage extends StatefulWidget {
  @override
  _FlashPageState createState() => _FlashPageState();
}

class _FlashPageState extends State<FlashPage> {
  bool condition = false; // Replace this with your actual condition

  @override
  void initState() {
    super.initState();
    checkCondition();
  }

  void checkCondition() async {
    // Simulating an asynchronous condition check
    await Future.delayed(Duration(seconds: 2));

    // Replace this with your actual condition checking logic
    setState(() {
      condition = false; // Set condition to true if it passes the check
    });

    // // Push to appropriate page based on condition
    // if (condition) {
    //   Navigator.pushReplacementNamed(context, '/main'); // Replace '/main' with your main page route
    // } else {
    //   Navigator.pushReplacementNamed(context, '/sign_in_screen'); // Replace '/signin' with your sign-in page route
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.blueGrey[400],

        decoration: const BoxDecoration(
          color: Colors.black,
          // image: DecorationImage(
          //   image: AssetImage(
          //       "assets/images/Xportex_logo_full_name.png"),
          //   fit: BoxFit.fitWidth,
          // ),

        ),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width*4/5,
                  // child: Image.asset('assets/images/Xportex_logo_full_name.png', fit: BoxFit.cover,)
                  // child: MyHomePage(title: "ABC",)
                  // child: FlipAnimation(child: Image.asset('assets/images/Xportex_logo_full_name.png', fit: BoxFit.cover,))
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      // Đo width (pixel) của 2 picture để đưa vào flex
                      Flexible(flex: 340,child: ImageOpacityAnimation(child: Image.asset('assets/images/Xportex_logo_full_name_hh-05.png', fit: BoxFit.cover,))),
                      Flexible(flex:160, child: FlipAnimation(child: Image.asset('assets/images/Xportex_logo_full_name_hh-06.png', fit: BoxFit.cover,)))
                    ],
                  )
              ),
            ),
            // Positioned(
            //   bottom: 30,
            //   right: 30,
            //   child: LoadingWidget()
            // ),
            Positioned(
                bottom: 30,
                right: 30,
                child: LoadingWidget()
            ),
            Positioned(
                bottom: 30,
                left: 30,
                child: ElevatedButton(
                  child: Text("Sign In"),
                  onPressed: ()=>Navigator.pushNamed(context, '/sign_in_screen'),
                )
            ),
            Positioned(
                bottom: 30,
                left: 120,
                child: ElevatedButton(
                  child: Text("Sign Up"),
                  onPressed: ()=>Navigator.pushNamed(context, '/sign_up_screen'),
                )
            ),
            Positioned(
                bottom: 30,
                left: 215,
                child: ElevatedButton(
                  child: Text("Home"),
                  onPressed: ()=>Navigator.pushNamed(context, '/home_screen'),
                )
            ),
            // Center(
            //   child: LoadingWidget(),
            // ),
          ],
        ),
      ),
    );
  }
}
