import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_29112021/customTabbarParam.dart';
import 'package:flutter_ui_29112021/custom_tabbar.dart';

class CustomLongPressDraggable<T extends Object> extends StatefulWidget {
  LongPressDraggableParam longPressDraggableParam;
  GlobalKey<CustomTabbarState> tabKey;
  int numOfTabs;
  // List<List<T>> pagesContent;
  CustomLongPressDraggable({Key? key,
    required this.longPressDraggableParam,
    required this.tabKey,
    // required this.pagesContent,
    required this.numOfTabs,
  }) : super(key: key);

  @override
  _CustomLongPressDraggableState<T> createState() => _CustomLongPressDraggableState<T>();
}

class _CustomLongPressDraggableState<T extends Object> extends State<CustomLongPressDraggable> {
  // bool tabBarMoveEnable = true;
  // int startIndex = 0;
  // int dropIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
      axis: widget.longPressDraggableParam.axis,
      data: widget.longPressDraggableParam.data,
      dragAnchorStrategy: widget.longPressDraggableParam.dragAnchorStrategy,
      feedback: widget.longPressDraggableParam.feedback,
      child: widget.longPressDraggableParam.child,
      childWhenDragging: widget.longPressDraggableParam.childWhenDragging,
      feedbackOffset: widget.longPressDraggableParam.feedbackOffset,
      maxSimultaneousDrags: widget.longPressDraggableParam.maxSimultaneousDrags,
      onDragStarted: widget.longPressDraggableParam.onDragStarted,
      // onDragStarted: (){
      //   startIndex = widget.tabKey.currentState?.tabController.index??0;
      // },
      onDragUpdate: (details) async{
        if(details.globalPosition.dx + 60> MediaQuery.of(context).size.width
            && (details.delta.direction > -pi/4 && details.delta.direction < pi/4)
            && widget.tabKey.currentState?.tabController.indexIsChanging != true
            && widget.tabKey.currentState!.tabController.index < widget.numOfTabs - 1
        ){
          widget.tabKey.currentState?.movetabbar(widget.tabKey.currentState!.tabController.index + 1);
          await Future.delayed(const Duration(milliseconds: 500));
        }
        if(details.globalPosition.dx - 60 < 0
            && (details.delta.direction > pi - pi/4 && details.delta.direction < pi + pi/4)
            && widget.tabKey.currentState?.tabController.indexIsChanging != true
            && widget.tabKey.currentState!.tabController.index > 0
        ){
          widget.tabKey.currentState?.movetabbar(widget.tabKey.currentState!.tabController.index - 1);
          await Future.delayed(const Duration(milliseconds: 500));
        }
        // print(details.delta.dx.toString() + " và " + details.delta.distance.toString() + " và " + details.delta.direction.toString());
        // print(details.globalPosition.dx);
      },
      onDraggableCanceled: widget.longPressDraggableParam.onDraggableCanceled,
      onDragCompleted: widget.longPressDraggableParam.onDragCompleted,
      onDragEnd: widget.longPressDraggableParam.onDragEnd,
      // onDragEnd: (details){
      //   if(widget.tabKey.currentState!.tabController.index != startIndex){
      //     // Nếu drop ở trang khác thì mới chuyển
      //     widget.pagesContent[startIndex].remove(value)
      //   }
      // },
      hapticFeedbackOnStart: widget.longPressDraggableParam.hapticFeedbackOnStart,
      ignoringFeedbackPointer: widget.longPressDraggableParam.ignoringFeedbackPointer,
      ignoringFeedbackSemantics: widget.longPressDraggableParam.ignoringFeedbackSemantics,
      delay: widget.longPressDraggableParam.delay,
    );
  }
}

