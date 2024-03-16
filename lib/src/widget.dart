import 'package:flutter/material.dart';

import 'paint.dart';

class CircularGradientSpinner extends StatefulWidget {
  final double size;
  final Duration? duration;
  final int gradientSteps;
  final double strokeWidth;
  final Color color;
  const CircularGradientSpinner({
    super.key,
    required this.color,
    required this.size,
    this.duration,
    this.gradientSteps = 8,
    this.strokeWidth = 20,
  });

  @override
  State<CircularGradientSpinner> createState() => _CircularGradientSpinnerState();
}

class _CircularGradientSpinnerState extends State<CircularGradientSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ??
          const Duration(
            seconds: 2,
          ),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return CustomPaint(
            painter: ProgressPainter(
              rotationAngle: _controller.value * 360,
              progressColor: widget.color,
              strokeWidth: widget.strokeWidth,
              gradientSteps: widget.gradientSteps,
            ),
            size: Size(
              widget.size,
              widget.size,
            ),
          );
        },
      ),
    );
  }
}
