import 'package:flutter/material.dart';

// Xem thêm https://www.youtube.com/watch?v=_R3E_aof69c nếu dùng pushNamed
class CustomPageRoute extends PageRouteBuilder{
  final Widget child;
  final AxisDirection direction;

  CustomPageRoute({required this.child, this.direction = AxisDirection.right}): super(

    // transitionDuration: Duration(seconds: 1), // tốc độ transition
    // reverseTransitionDuration: Duration(seconds: 1), // tốc độ transition ngược lại
    pageBuilder: (context, animation, secondaryAnimation) => child
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    // return super.buildTransitions(context, animation, secondaryAnimation, child);
    /// nhỏ -> to
    // return ScaleTransition(
    //   scale: animation,
    //   child: child,
    // );
    /// từ cạnh
    return SlideTransition(
      position: Tween<Offset>(
        begin: getBeginOffset(), // -1: bên trái, 1 bên phải
        end: Offset.zero
      ).animate(animation),
      child: child,
    );
  }

  Offset getBeginOffset(){
    switch(direction){
      case AxisDirection.up:
        return Offset(0, 1);
      case AxisDirection.down:
        return Offset(0, -1);
      case AxisDirection.right:
        return Offset(-1, 0);
      case AxisDirection.left:
        return Offset(1, 0);
    }
  }
}