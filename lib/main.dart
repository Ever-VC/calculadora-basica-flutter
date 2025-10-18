import 'package:calculadora/screens/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora",
      theme: ThemeData(colorSchemeSeed: Colors.indigoAccent[700]),
      home: CalculatorApp(),
    );
  }
}
