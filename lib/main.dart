import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_29112021/custom_theme.dart';
import 'package:flutter_ui_29112021/flash/flash_screen.dart';
import 'package:flutter_ui_29112021/home/drawer_custom.dart';
import 'package:flutter_ui_29112021/home/home_screen.dart';
import 'package:flutter_ui_29112021/home/page_route_custom.dart';
import 'package:flutter_ui_29112021/html_editor.dart';
import 'package:flutter_ui_29112021/model/token.dart';
import 'package:flutter_ui_29112021/provider_test.dart';
import 'package:flutter_ui_29112021/quill_html.dart';
import 'package:flutter_ui_29112021/scroll_to_index/scroll_to_index.dart';
import 'package:flutter_ui_29112021/scroll_to_index/scrollable_positioned_list.dart';
import 'package:flutter_ui_29112021/sign_in/sign_in_screen.dart';
import 'package:flutter_ui_29112021/sign_up/keyboard_prevent.dart';
import 'package:flutter_ui_29112021/sign_up/sign_up_screen.dart';
import 'package:flutter_ui_29112021/tabPage.dart';
import 'package:flutter_ui_29112021/tabPage02.dart';
import 'package:flutter_ui_29112021/tabPage03.dart';
import 'package:flutter_ui_29112021/tabPage04.dart';
import 'package:flutter_ui_29112021/tabPage05.dart';
import 'package:flutter_ui_29112021/wrap_test.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Provider<String>.value(
        value: "ABC",
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "My App",
          // home: HomePage(),
          home: FlashPage(),
          // theme: customTheme,
          theme: ThemeData(
            brightness: Brightness.light, // Set the default theme to light
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark, // Set the dark theme
          ),
          themeMode: ThemeMode.dark,
          routes: {
            "/sign_in_screen": (context) => SignInPage(),
            "/sign_up_screen": (context) => SignUpPage(),
            "/home_screen": (context) => HomeScreen(),
          },
          // onGenerateRoute: (route) => onGenerateRoute(route),
        ),
      ),
    );

  }

  // static Route onGenerateRoute(RouteSettings settings){
  //   switch(settings.name){
  //     case '/second':
  //       return CustomPageRoute(
  //           child: DrawerPage(),
  //         direction:
  //       );
  //     case '/first':
  //     default:
  //     return MaterialPageRoute(
  //         builder: (context) => SignUpPage(),
  //         settings: settings
  //     );
  //   }
  // }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textController1 = TextEditingController();

  final TextEditingController textController2 = TextEditingController();

  double dataResult = double.infinity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calculator 01"),
      ),
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(5),
            constraints: BoxConstraints.expand(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: textController1,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      hintText: "Input Number 1",
                      // disabledBorder: InputBorder.none,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      )
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: textController2,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      hintText: "Input Number 2",
                      // disabledBorder: InputBorder.none,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      )
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                      dataResult == double.infinity ? "" : "Ket qua = $dataResult" ,
                      style: TextStyle(
                          color: Colors.red ,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                      )
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: ElevatedButton(onPressed: (){
                          String text1 = textController1.text.toString();
                          String text2 = textController2.text.toString();

                          if (text1.isEmpty || text2.isEmpty){
                            ScaffoldMessenger
                                .of(context)
                                .showSnackBar(
                                SnackBar(content: Text("Ban chua nhap du thong tin"))
                            );
                            return;
                          }
                          double number1 = double.parse(text1);
                          double number2 = double.parse(text2);
                          setState(() {
                            dataResult = (number1 + number2);
                          });

                        }, child: Text("+")),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: ElevatedButton(onPressed: (){
                          String text1 = textController1.text.toString();
                          String text2 = textController2.text.toString();

                          if (text1.isEmpty || text2.isEmpty){
                            ScaffoldMessenger
                                .of(context)
                                .showSnackBar(
                                SnackBar(content: Text("Ban chua nhap du thong tin"))
                            );
                            return;
                          }
                          double number1 = double.parse(text1);
                          double number2 = double.parse(text2);
                          setState(() {
                            dataResult = (number1 - number2);
                          });
                        }, child: Text("-")),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: ElevatedButton(onPressed: (){
                          String text1 = textController1.text.toString();
                          String text2 = textController2.text.toString();

                          if (text1.isEmpty || text2.isEmpty){
                            ScaffoldMessenger
                                .of(context)
                                .showSnackBar(
                                SnackBar(content: Text("Ban chua nhap du thong tin"))
                            );
                            return;
                          }
                          double number1 = double.parse(text1);
                          double number2 = double.parse(text2);
                          setState(() {
                            dataResult = (number1 * number2);
                          });
                        }, child: Text("*")),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: ElevatedButton(onPressed: (){
                          String text1 = textController1.text.toString();
                          String text2 = textController2.text.toString();

                          if (text1.isEmpty || text2.isEmpty){
                            ScaffoldMessenger
                                .of(context)
                                .showSnackBar(
                                SnackBar(content: Text("Ban chua nhap du thong tin"))
                            );
                            return;
                          }

                          double number1 = double.parse(text1);
                          double number2 = double.parse(text2);
                          if(number2 == 0){
                            ScaffoldMessenger
                                .of(context)
                                .showSnackBar(
                                SnackBar(content: Text("Mẫu số phải khác 0")));
                          }
                          setState(() {
                            dataResult = (number1 / number2);
                          });
                        }, child: Text("/")),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}



