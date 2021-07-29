import 'dart:core';

import 'package:flutter/material.dart';

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.center,
        radius: 1,
        colors: [Colors.cyan, Colors.blue],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
