import 'package:flutter/material.dart';

class LogWidget extends StatefulWidget {
  MaterialColor color;
  // VoidCallback? setColorFromParent;
  LogWidget({Key? key, this.color = Colors.grey, }) : super(key: key);

  void setColorFromParent(MaterialColor color){
    createState().setColor(color);
  }

  @override
  LogWidgetState createState() => LogWidgetState();
}

class LogWidgetState extends State<LogWidget> {
  void setColor(MaterialColor color){
    setState(() {
      widget.color = color;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      color: widget.color,
    );
  }
}
