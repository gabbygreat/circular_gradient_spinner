import 'package:circular_gradient_spinner/circular_gradient_spinner.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const PaintApp(),
    );
  }
}

class PaintApp extends StatefulWidget {
  const PaintApp({super.key});

  @override
  State<PaintApp> createState() => _PaintAppState();
}

class _PaintAppState extends State<PaintApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress'),
      ),
      body: const CircularGradientSpinner(
        color: Colors.black,
        size: 200,
        strokeWidth: 30,
      ),
    );
  }
}
