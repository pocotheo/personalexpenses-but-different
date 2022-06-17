import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math.dart' as vector;
import '../constants.dart';

class WavePainter extends CustomPainter {
  AnimationController animationController;
  final bool isRightDirection;
  final Color topColor;
  final Color bottomColor;
  final int x;
  WavePainter(
      {required this.isRightDirection,
      required this.animationController,
      required this.topColor,
      required this.bottomColor,
      required this.x});

  @override
  void paint(Canvas canvas, Size size) {
    double xOffset = size.width / 2;
    List<Offset> polygonOffsets = [];

    for (int i = -xOffset.toInt(); i <= xOffset; i++) {
      polygonOffsets.add(Offset(
          i.toDouble(),
          isRightDirection
              ? math.sin(vector.radians(i.toDouble() * 360 / kWaveLength) -
                          vector.radians(animationController.value)) *
                      20 +
                  60 -
                  x
              : math.sin(vector.radians(i.toDouble() * 360 / kWaveLength) +
                          vector.radians(animationController.value)) *
                      20 +
                  65 -
                  x));
    }

    final Gradient gradient = LinearGradient(
        begin: Alignment.bottomLeft, //top
        end: Alignment.topRight, //center
        colors: <Color>[
          topColor,
          bottomColor,
        ]);
    final wave = Path();
    wave.addPolygon(polygonOffsets, false);
    wave.lineTo(xOffset, size.height);
    wave.lineTo(-xOffset, size.height);
    wave.close();

    final rect = Rect.fromLTWH(
        0.0,
        isRightDirection ? -size.height / 5 - 25 : -size.height / 5 - 22,
        size.width,
        size.height / 2);
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;
    //  canvas.drawRect(rect, paint);
    canvas.drawPath(wave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
