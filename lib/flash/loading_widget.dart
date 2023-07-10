import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCube(
      size: 30,
      color: Colors.white,
      // itemBuilder: (context, index) => Container(width: 30, height: 30, color: Colors.red,)
    );
  }
}