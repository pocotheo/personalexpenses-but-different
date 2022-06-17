import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    print(size);
    return Rect.fromCenter(
        center: Offset(0, 0), width: size.width - 20, height: size.height - 20);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
