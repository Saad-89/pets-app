import 'dart:math';

import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final double amplitude;
  final double frequency;
  final Color color;

  WavePainter(
      {required this.amplitude, required this.frequency, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    path.moveTo(0.0, size.height);
    for (int i = 0; i <= size.width.toInt(); i++) {
      path.lineTo(
        i.toDouble(),
        size.height -
            amplitude *
                sin((i.toDouble() * frequency) +
                    (pi / 15)), // sin function to generate the wave effect
      );
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
