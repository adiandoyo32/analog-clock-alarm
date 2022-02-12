import 'package:flutter/material.dart';

class ClockCircle extends StatelessWidget {
  const ClockCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
