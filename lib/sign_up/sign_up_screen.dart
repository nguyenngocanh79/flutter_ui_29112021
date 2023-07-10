import 'package:flutter/material.dart';
import 'package:flutter_ui_29112021/sign_in/version.dart';
import '../common/constant.dart';

import '../flash/loading_widget.dart';

class SignUpPage extends StatefulWidget {

  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  var isPassVisible = true;

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
          ),
          child: Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraint) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: constraint.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              // fit: FlexFit.loose,
                              // child: Image.network("https://erp.pecc5.vn/web/binary/company_logo",
                              child: Image.asset(
                                "assets/images/Xportez_logo_galaxy.png",
                                width: MediaQuery.of(context).size.width * 3.5 / 5,
                              ),
                            ),
                            Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildLoginTextField(),
                                    _buildPasswordTextField(),
                                    _buildPasswordTextField(),

                                    /// Sign up Button
                                    Column(
                                      children: [
                                        _buildButtonSignUp(),
                                      ],
                                    ),
                                  ],
                                ),
                            ),
                            Expanded(
                              flex: 1,
                              // fit: FlexFit.loose,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: VersionWidget(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              /// Cách 2
              // Cách khác: https://stackoverflow.com/questions/56326005/how-to-use-expanded-in-singlechildscrollview
              // CustomScrollView(
              //   slivers: [
              //     SliverFillRemaining(
              //       hasScrollBody: false,
              //       child: Column(
              //         children: [
              //           Expanded(
              //             flex: 2,
              //             // child: Image.network("https://erp.pecc5.vn/web/binary/company_logo",
              //             child: Image.asset(
              //               "assets/images/Xportex_logo_snail_cloud.png",
              //               width: MediaQuery.of(context).size.width * 3.5 / 5,
              //             ),
              //           ),
              //           Expanded(
              //             flex: 4,
              //             child: Container(
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 children: [
              //                   _buildLoginTextField(),
              //                   _buildPasswordTextField(),
              //                   _buildPasswordTextField(),
              //
              //                   /// Sign up Button
              //                   Column(
              //                     children: [
              //                       _buildButtonSignUp(),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //           Expanded(
              //             flex: 1,
              //             child: Align(
              //               alignment: Alignment.bottomCenter,
              //               child: Padding(
              //                 padding: const EdgeInsets.all(16.0),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                   // crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     Image.asset(
              //                       "assets/images/A2U_logo_02.png",
              //                       width: MediaQuery.of(context).size.width * 1 / 15,
              //                       // height: 100,
              //                       // fit: BoxFit.fitHeight,
              //                     ),
              //                     Text.rich(
              //                       TextSpan(
              //                         text: 'Version ', // default text style
              //                         children: <TextSpan>[
              //                           TextSpan(text: "1.1.0"),
              //                         ],
              //                       ),
              //                     ),
              //                     SizedBox(width: MediaQuery.of(context).size.width * 1 / 15),
              //                     // Spacer(),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              /// Back button + "Sign up"
              Positioned(
                left: 5,
                top: 5,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(width: 15,),
                    Text("Sign up", style: TextStyle(fontSize: 16),),
                  ],
                ),
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

  Widget _buildPasswordTextField() {
    return Container(
      height: 50,
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

  Widget _buildButtonSignUp() {
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
                child: Text("Sign up"),
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