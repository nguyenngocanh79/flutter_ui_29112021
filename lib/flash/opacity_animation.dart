import 'package:flutter/material.dart';

class ImageOpacityAnimation extends StatefulWidget {
  Widget child;
  ImageOpacityAnimation({Key? key, required this.child}) : super(key: key);

  @override
  _ImageOpacityAnimationState createState() => _ImageOpacityAnimationState();
}

class _ImageOpacityAnimationState extends State<ImageOpacityAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Create the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500), // Set the duration of the animation
    );

    // Create the opacity animation tween
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    // Dispose the animation controller when the widget is disposed
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: widget.child, // Replace with your image asset path
        );
      },
    );
  }
}
