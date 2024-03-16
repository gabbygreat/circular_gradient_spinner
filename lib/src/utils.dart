import 'package:flutter/material.dart';

List<Color> generateGradientColors(Color baseColor, {int steps = 8}) {
  List<Color> colors = [];

  for (int i = 0; i < steps; i++) {
    // Calculate the ratio of blending
    final ratio = i / (steps - 1);
    // Lerp between the base color and white
    final color = Color.lerp(
      baseColor,
      Colors.white,
      ratio,
    );

    if (color != null) {
      colors.add(color);
    }
  }

  return colors;
}
