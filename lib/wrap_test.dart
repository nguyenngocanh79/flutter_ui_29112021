import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class WrapTest extends StatefulWidget {
  const WrapTest({Key? key}) : super(key: key);

  @override
  _WrapTestState createState() => _WrapTestState();
}

class _WrapTestState extends State<WrapTest> {


  @override
  Widget build(BuildContext context) {
    String text1 = "";
    String text2 = "Phải Phải Phải Phải Phải Phải ";
    Widget widget1 = Wrap(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Text(text1),
      ],
    );
    Widget widget2 = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(text2, style: TextStyle(fontWeight: FontWeight.bold),),
      ],
    );
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if(text1 != "") Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.min,
            children: [

              Expanded(child: Text(text1, overflow: TextOverflow.ellipsis, maxLines: 3,)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Text(text2,style: TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, textAlign: TextAlign.right,)),
            ],
          )
        ],
      ),
    );
  }

  // Calculate size of Text
  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style), maxLines: 1, textDirection: ui.TextDirection.ltr,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
    )
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
