// import 'package:flutter/material.dart';
// import 'package:flutter_ui_29112021/model/token.dart';
// import 'package:provider/provider.dart';
//
// class ProviderPage01 extends StatefulWidget {
//   const ProviderPage01({Key? key}) : super(key: key);
//
//   @override
//   _ProviderPage01State createState() => _ProviderPage01State();
// }
//
// class _ProviderPage01State extends State<ProviderPage01> {
//   @override
//   Widget build(BuildContext context) {
//     var a = number..parse("2.1.4");
//     print(a.toString());
//     return Provider(
//         create: (_)=>TokenModel("token"),
//       child: Scaffold(
//         appBar: AppBar(title: Text("Page 01"),),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: (){
//               Navigator.pushNamed(context, "/provider_02");
//             },
//             child: Text("page 02"),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ProviderPage02 extends StatefulWidget {
//   const ProviderPage02({Key? key}) : super(key: key);
//
//   @override
//   _ProviderPage02State createState() => _ProviderPage02State();
// }
//
// class _ProviderPage02State extends State<ProviderPage02> {
//   @override
//   Widget build(BuildContext context) {
//     return Provider<TokenModel>(
//         create: (_)=>TokenModel("token"),
//       child: Scaffold(
//         appBar: AppBar(title: Text("Page 02"),),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: (){
//               Navigator.pushNamed(context, "/provider_03");
//             },
//             child: Text("page 03"),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ProviderPage03 extends StatefulWidget {
//   const ProviderPage03({Key? key}) : super(key: key);
//
//   @override
//   _ProviderPage03State createState() => _ProviderPage03State();
// }
//
// class _ProviderPage03State extends State<ProviderPage03> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Provider<int>.value(
//       value: 3,
//       builder: (context, child) {
//         String s = context.read<String>().toString();
//         String token = context.read<TokenModel>().token;
//         String num = context.read<int>().toString();
//         // No longer throws
//         return main_screen(child: Text(s + token + num + "SS"));
//       }
//     );
//   }
// }
//
// class main_screen extends StatefulWidget {
//   final Widget? child;
//
//   const main_screen({Key? key, this.child}) : super(key: key);
//
//   @override
//   _main_screenState createState() => _main_screenState();
// }
//
// class _main_screenState extends State<main_screen> {
//   @override
//   Widget build(BuildContext context) {
//     // TokenModel tokenModel = context.read<TokenModel>();
//     // print("main_screen: " + tokenModel.token);
//     return Container(
//
//         child: widget.child ?? Container());
//   }
// }
