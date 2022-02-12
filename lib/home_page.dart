import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:touchable/touchable.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 0),
                      color: Colors.black12.withOpacity(0.14),
                      blurRadius: 64,
                    )
                  ],
                ),
                // child: CustomPaint(
                //   painter: ClockPainter(context, _dateTime),
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  ClockPainter(this.context, this.dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    // hour line
    Paint hourPainter = Paint()
      ..color = Colors.black38
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    myCanvas.drawLine(
      center,
      const Offset(90, 200),
      hourPainter,
    );

    canvas.drawLine(
      center,
      const Offset(80, 300),
      Paint()
        ..color = Colors.black45
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8,
    );

    // Second Calculation
    // size.width * 0.4 define our line height
    // dateTime.second * 6 because 360 / 60 = 6
    double secondX =
        centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);
    double secondY =
        centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);

    // second line
    canvas.drawLine(
        center, Offset(secondX, secondY), Paint()..color = Colors.red);

    Paint dotPainter = Paint()..color = Colors.black12;
    canvas.drawCircle(center, 24, dotPainter);
    canvas.drawCircle(center, 22, Paint()..color = Colors.white);
    canvas.drawCircle(center, 10, dotPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
