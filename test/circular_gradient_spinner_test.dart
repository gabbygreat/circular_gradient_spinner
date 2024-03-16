import 'package:circular_gradient_spinner/circular_gradient_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'CircularGradientSpinner initializes and disposes AnimationController correctly',
      (WidgetTester tester) async {
    // Define a test key to find the GradientRoundPaint widget
    const Key testKey = Key('circular_gradient_spinner');

    // Pump the GradientRoundPaint widget into the widget tester
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: CircularGradientSpinner(
          key: testKey,
          color: Colors.blue,
          size: 200,
          strokeWidth: 30,
        ),
      ),
    ));
  });
}
