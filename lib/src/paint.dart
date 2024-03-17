import 'dart:math' show pi, cos, sin;

import 'package:flutter/material.dart';

import 'enum.dart';
import 'utils.dart';

extension NumToRadians on num {
  double toRadians() {
    return toDouble() * (pi / 180.0);
  }

  double toDegree() {
    return toDouble() * (180 / pi);
  }
}

class ProgressPainter extends CustomPainter {
  final double rotationAngle;
  final double strokeWidth;
  final Color progressColor;
  final int gradientSteps;
  final SpinnerDirection spinnerDirection;

  ProgressPainter({
    this.rotationAngle = 0,
    this.strokeWidth = 20,
    required this.progressColor,
    this.gradientSteps = 8,
    required this.spinnerDirection,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var radius = size.width / 2;

    List<Color> gradientColors = generateGradientColors(
      progressColor,
      steps: gradientSteps,
    );

    double startAngle = 0;
    double sweepAngle = 360;

    var rect = Rect.fromCenter(
      center: Offset(centerX, centerY),
      width: size.width,
      height: size.height,
    );

    var shader = SweepGradient(
      startAngle: startAngle.toRadians(),
      endAngle: (startAngle + sweepAngle).toRadians(),
      colors: gradientColors,
    ).createShader(rect);

    var paint = Paint()
      ..strokeWidth = strokeWidth
      ..shader = shader
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    var startCapPosition = Offset(
      centerX + radius * cos(startAngle.toRadians()),
      centerY + radius * sin(startAngle.toRadians()),
    );

    var startCapPaint = Paint()..color = gradientColors.first;

    // Rotating the canvas

    // Save the current canvas state
    canvas.save();
    // Move the canvas origin to the center
    canvas.translate(centerX, centerY);
    // Rotate the canvas
    double rotationRadians = rotationAngle.toRadians();
    if (spinnerDirection == SpinnerDirection.antiClockwise) {
      rotationRadians = -rotationRadians;
    }
    canvas.rotate(rotationRadians);
    // Move the canvas origin back
    canvas.translate(-centerX, -centerY);

    canvas.drawArc(
      rect,
      0.toRadians(),
      (startAngle + sweepAngle).toRadians(),
      false,
      paint,
    );

    canvas.drawArc(
      Rect.fromCenter(
        center: startCapPosition,
        width: strokeWidth,
        height: strokeWidth,
      ),
      0,
      -180.toRadians(),
      true,
      startCapPaint,
    );

    // Restore the canvas to the saved state
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant ProgressPainter oldDelegate) {
    return rotationAngle != oldDelegate.rotationAngle;
  }
}
