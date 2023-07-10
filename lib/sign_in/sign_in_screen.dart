import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_29112021/common/constant.dart';
import 'package:flutter_ui_29112021/sign_in/version.dart';

import '../flash/loading_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:developer' as developer;

class SignInPage extends StatefulWidget {

  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  var isPassVisible = true;

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

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
          // color: Color(0xFF140037),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorDeepDarkBlue,
                colorDeepDarkBlue,
                colorDarkBlue,
                Colors.black,

              ],
              stops: [0.0, 0.25, 0.75, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            // gradient: LinearGradient(
            //   colors: [
            //     Colors.blue,
            //     Colors.blue,
            //     Color(0xFF140037),
            //     Colors.black,
            //
            //   ],
            //   stops: [0.0, 0.25, 0.75, 1.0],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 2,
                    // child: Image.network("https://erp.pecc5.vn/web/binary/company_logo",
                    child: Image.asset(
                      "assets/images/Xportez_logo_galaxy.png",
                      width: MediaQuery.of(context).size.width * 3.5 / 5,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildLoginTextField(),
                          _buildPasswordTextField(),
                          /// Sign in Button and Sign up
                          Column(
                            children: [
                              _buildButtonSignIn(),
                              /// Sign up
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("New to XportEX, "),
                                    InkWell(
                                      child: Text(
                                        "Sign up!",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      onTap: (){
                                        Navigator.of(context).pushNamed("/sign_up_screen");
                                      },
                                    )
                                  ],
                                ),
                              ),
                              // Text('Connection Status: ${_connectionStatus.toString()}')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    // fit: FlexFit.loose,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: VersionWidget(),
                    ),
                  ),
                ],
              ),
              /// "Sign in"
              Positioned(
                left: 20,
                top: 20,
                child: Text("Sign in", style: TextStyle(fontSize: 16),),
              ),
              // /// A2U logo
              // Positioned(
              //   left: 20,
              //     bottom: 20,
              //     child: Image.asset(
              //       "assets/images/A2U_logo_02.png",
              //       width: MediaQuery.of(context).size.width * 1 / 15,
              //       // height: 100,
              //       // fit: BoxFit.fitHeight,
              //     ),
              // ),
              // /// version
              // Positioned(
              //   left: 0,
              //   right: 0,
              //   bottom: 20,
              //   child: Center(
              //     child: Column(
              //       children: [
              //         Text.rich(
              //           TextSpan(
              //             text: 'Version ', // default text style
              //             children: <TextSpan>[
              //               TextSpan(text: "1.1.0"),
              //             ],
              //           ),
              //         ),
              //
              //         // Text("Developed by: A2U"),
              //       ],
              //     ),
              //   ),
              // ),
              // if (state is SignInLoading)
              //   Center(child: LoadingWidget())
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

  Widget _buildPasswordTextField() {
    return Container(
      // height: 50,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: TextField(
        maxLines: 1,
        controller: _passController,
        obscureText: isPassVisible,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          // fillColor: Color(0xFF39E8C3),
          filled: true,
          hintText: "Password",
          contentPadding: const EdgeInsets.only(left: 5, top: 9.0, bottom: 9.0),
          isDense: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0, color: Colors.black12)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0, color: Colors.black12)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0, color: Colors.black12)),
          labelStyle: TextStyle(color: Colors.blue),
          prefixIcon: Icon(Icons.lock, color: Theme.of(context).colorScheme.primary),
          suffixIcon: IconButton(
            icon: Icon( isPassVisible
                ? Icons.visibility
                : Icons.visibility_off, color: Theme.of(context).colorScheme.primary),
            onPressed: (){
              setState(() {
                isPassVisible = !isPassVisible;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildButtonSignIn() {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              // style: ElevatedButton.styleFrom(primary: Colors.lightBlue,),

              onPressed: () {
                String email = _emailController.text.toString();
                String password = _passController.text.toString();

                // bloc.add(SignInEvent(email: email, password: password));
              },
              child: Text("Sign in"),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          // side: BorderSide(color: Colors.red)
                      )
                  ),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(MediaQuery.of(context).size.width*3/5, 40)
                )
              )
            )
          ],
        ));
  }
}