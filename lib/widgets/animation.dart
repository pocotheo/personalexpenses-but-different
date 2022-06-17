import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/circle_clipper.dart';
import '../models/wave_painter.dart';

class Animation1 extends StatefulWidget {
  final num x;
  final num percentage;
  Animation1({required this.x, required this.percentage});
  @override
  State<Animation1> createState() => _Animation1State();
}

class _Animation1State extends State<Animation1> with TickerProviderStateMixin {
  late AnimationController animationController;
  late CurvedAnimation animation = CurvedAnimation(
    parent: animationController,
    curve: Curves.ease,
  );
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 5),
      lowerBound: 0,
      upperBound: 360,
      vsync: this,
    );
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = 80;
    var xinput = widget.x;
    return Container(
        height: size.height / 2 - height,
        width: size.width,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) => Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Container(
                  width: 180.0,
                  height: 180.0,
                  decoration: new BoxDecoration(
                    gradient: RadialGradient(
                        colors: [Color(0xFFF7FAF4), Color(0xFFEDF3F6)],
                        stops: [0.9, 1]),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: (size.height / 2 - height) / 2,
                left: size.width / 2,
                child: ClipOval(
                  clipper: CircleClipper(),
                  child: CustomPaint(
                    size: kSize,
                    painter: WavePainter(
                        x: xinput.toInt(),
                        topColor: topColor1,
                        bottomColor: bottomColor1,
                        animationController: animationController,
                        isRightDirection: true),
                  ),
                ),
              ),
              Positioned(
                top: (size.height / 2 - height) / 2,
                left: size.width / 2,
                child: ClipOval(
                  clipper: CircleClipper(),
                  child: CustomPaint(
                    size: kSize,
                    painter: WavePainter(
                        x: xinput.toInt(),
                        topColor: topColor2,
                        bottomColor: bottomColor2,
                        animationController: animationController,
                        isRightDirection: false),
                  ),
                ),
              ),
              Positioned(
                child: Text('${widget.percentage} %',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35)),
              )
            ],
          ),
        ));
  }
}
