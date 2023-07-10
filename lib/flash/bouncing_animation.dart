import 'package:flutter/material.dart';

class BouncingImageAnimation extends StatefulWidget {
  const BouncingImageAnimation({Key? key}) : super(key: key);

  @override
  _BouncingImageAnimationState createState() => _BouncingImageAnimationState();
}

class _BouncingImageAnimationState extends State<BouncingImageAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Create the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500), // Set the duration of the animation
    );

    // Create the curved animation for the bouncing effect
    final curvedAnimation =
    CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);

    // Create the tween for the scale animation
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(curvedAnimation);

    // Add a listener to trigger the animation again when it completes
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

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
        return Transform.scale(
            scale: _animation.value,
            child: Image.asset('assets/images/Xportex_logo_full_name.png', fit: BoxFit.cover,), // Replace with your image asset path
        );
      },
    );
  }
}
