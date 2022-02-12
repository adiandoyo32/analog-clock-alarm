import 'dart:math';

import 'package:flutter/material.dart';

class HourPainter extends StatelessWidget {
  const HourPainter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final hour = DateTime.now().hour.toDouble();
    final angle = (-pi * (hour / -12)) * 2;

    print(hour);
    print(angle);

    return GestureDetector(
      onLongPressMoveUpdate: (details) {},
      child: RotatedBox(
        quarterTurns: 2,
        child: Transform.rotate(
          angle: 6.28,
          child: Transform.translate(
            offset: const Offset(0, 20),
            child: Center(
              child: Container(
                height: height * 0.1,
                width: 4,
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
