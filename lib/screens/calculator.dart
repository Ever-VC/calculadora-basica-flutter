import 'package:calculadora/screens/widgets/calc_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  final primaryColor = Color.fromARGB(255, 77, 77, 77);
  final secondaryColor = Color.fromARGB(255, 143, 143, 143);
  final baseColor = Color.fromARGB(0, 255, 82, 82);
  double result = 0.0;
  
  void allClear(String text) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var children = [
      Container(
        alignment: Alignment(1.0, 1.0),
        child: Padding(
          padding: EdgeInsets.only(right: 12),
          child: Text(
            "Historial",
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(
                fontSize: 24,
                color: Color(0xFF545F61),
              ),
            ),
          ),
        ),
      ),
      Container(
        alignment: Alignment(1.0, 1.0),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Text(
            "2+8",
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(fontSize: 48, color: Colors.white),
            ),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CalcButton(
            callback: allClear,
            text: "AC",
            textSize: 20,
            color: primaryColor,
          ),
          CalcButton(
            callback: allClear,
            text: "C",
            textSize: 20,
            color: primaryColor,
          ),
          CalcButton(
            callback: allClear,
            text: "%",
            textSize: 20,
            color: primaryColor,
          ),
          CalcButton(
            callback: allClear,
            text: "/",
            textSize: 20,
            color: secondaryColor,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CalcButton(
            callback: allClear,
            text: "7",
            textSize: 20,
            color: baseColor,
          ),
          CalcButton(
            callback: allClear,
            text: "8",
            textSize: 20,
            color: baseColor,
          ),
          CalcButton(
            callback: allClear,
            text: "9",
            textSize: 20,
            color: baseColor,
          ),
          CalcButton(
            callback: allClear,
            text: "X",
            textSize: 20,
            color: secondaryColor,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CalcButton(
            callback: allClear,
            text: "4",
            textSize: 20,
            color: baseColor,
          ),
          CalcButton(
            callback: allClear,
            text: "5",
            textSize: 20,
            color: baseColor,
          ),
          CalcButton(
            callback: allClear,
            text: "6",
            textSize: 20,
            color: baseColor,
          ),
          CalcButton(
            callback: allClear,
            text: "-",
            textSize: 20,
            color: secondaryColor,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CalcButton(
            callback: allClear,
            text: "1",
            textSize: 20,
            color: baseColor,
          ),
          CalcButton(
            callback: allClear,
            text: "2",
            textSize: 20,
            color: baseColor,
          ),
          CalcButton(
            callback: allClear,
            text: "3",
            textSize: 20,
            color: baseColor,
          ),
          CalcButton(
            callback: allClear,
            text: "+",
            textSize: 20,
            color: secondaryColor,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CalcButton(
            callback: allClear,
            text: "+/-",
            textSize: 20,
            color: baseColor,
          ),
          CalcButton(
            callback: allClear,
            text: "0",
            textSize: 20,
            color: baseColor,
          ),
          CalcButton(
            callback: allClear,
            text: ".",
            textSize: 20,
            color: baseColor,
          ),
          CalcButton(
            callback: allClear,
            text: "=",
            textSize: 20,
            color: const Color.fromARGB(255, 0, 117, 6),
          ),
        ],
      ),
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 20, 20),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: children,
        ),
      ),
    );
  }
}
