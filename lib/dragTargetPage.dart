import 'package:flutter/material.dart';

class DragTargetPage<T extends Object> extends StatelessWidget {
  // const DragTargetPage({Key? key}) : super(key: key);
  DragTargetPage({
    Key? key,
    required this.child,
    this.onWillAccept,
    this.onAccept,
    this.onAcceptWithDetails,
    this.onLeave,
    this.onMove,
    this.hitTestBehavior = HitTestBehavior.translucent,
  }): super(key: key);

  Widget child;

  /// Called to determine whether this widget is interested in receiving a given
  /// piece of data being dragged over this drag target.
  ///
  /// Called when a piece of data enters the target. This will be followed by
  /// either [onAccept] and [onAcceptWithDetails], if the data is dropped, or
  /// [onLeave], if the drag leaves the target.
  final DragTargetWillAccept<T>? onWillAccept;

  /// Called when an acceptable piece of data was dropped over this drag target.
  ///
  /// Equivalent to [onAcceptWithDetails], but only includes the data.
  final DragTargetAccept<T>? onAccept;

  /// Called when an acceptable piece of data was dropped over this drag target.
  ///
  /// Equivalent to [onAccept], but with information, including the data, in a
  /// [DragTargetDetails].
  final DragTargetAcceptWithDetails<T>? onAcceptWithDetails;

  /// Called when a given piece of data being dragged over this target leaves
  /// the target.
  final DragTargetLeave<T>? onLeave;

  /// Called when a [Draggable] moves within this [DragTarget].
  ///
  /// Note that this includes entering and leaving the target.
  final DragTargetMove<T>? onMove;

  /// How to behave during hit testing.
  ///
  /// Defaults to [HitTestBehavior.translucent].
  final HitTestBehavior hitTestBehavior;


  @override
  Widget build(BuildContext context) {
    return DragTarget<T>(
        builder: (context, candidateItems, rejectedItems){
          bool highlighted = candidateItems.isNotEmpty;
          return Material(
            elevation: highlighted ? 8.0 : 4.0,
            // borderRadius: BorderRadius.circular(22.0),
            color: highlighted ? const Color(0xFFF64209) : Colors.white,
            child: child,
          );
        },
      onAccept: onAccept,
      onAcceptWithDetails: onAcceptWithDetails,
      onLeave: onLeave,
      onMove: onMove,
      hitTestBehavior: hitTestBehavior,
    );
  }
}
