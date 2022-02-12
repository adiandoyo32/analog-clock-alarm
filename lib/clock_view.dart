import 'package:analog_clock_alarm/clock_circle.dart';
import 'package:analog_clock_alarm/hour_painter.dart';
import 'package:flutter/material.dart';

class ClockView extends StatelessWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: const [
                ClockCircle(),
                HourPainter(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
