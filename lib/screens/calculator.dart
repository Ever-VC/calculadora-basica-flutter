import 'package:calculadora/screens/widgets/calc_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  final _primaryColor = Color.fromARGB(255, 77, 77, 77);
  final _secondaryColor = Color.fromARGB(255, 143, 143, 143);
  final _baseColor = Color.fromARGB(0, 255, 82, 82);
  String _history = '';
  String _experssion = '';
  int startParentheses = 0;
  int endParentheses = 0;

  void allClear(String text) {
    startParentheses = 0;
    endParentheses = 0;
    setState(() {
      _history = '';
      _experssion = '';
    });
  }

  void clearOnce() {
    setState(() {
      // Verifica si el elemento a eliminar es un paréntesis
      if (_experssion.isNotEmpty) {
        String lastChar = _experssion[_experssion.length - 1];
        if (lastChar == '(') {
          startParentheses--;
        } else if (lastChar == ')') {
          endParentheses--;
        }
      }
      _experssion = _experssion.substring(0, _experssion.length - 1);
    });
  }

  void changeSing(String text) {
    String tempExpress = _experssion;
    String first = tempExpress.substring(0, _experssion.length - 1);
    String lastest = tempExpress.substring(_experssion.length - 1);
    tempExpress = "$first(-$lastest";
    setState(() {
      _experssion = tempExpress;
    });
  }

  void addParentheses(String text) {
    String temExpress = _experssion;
    if (temExpress.isNotEmpty) {
      String lastChar = temExpress[temExpress.length - 1];
      if (double.tryParse(lastChar) == null && lastChar != ')') {
        temExpress = "$temExpress(";
        startParentheses++;
      } else if (startParentheses < endParentheses ||
          startParentheses == endParentheses) {
        temExpress = "$temExpress×(";
        startParentheses++;
      } else {
        temExpress = "$temExpress)";
        endParentheses++;
      }
    } else {
      temExpress = '(';
      startParentheses++;
    }

    setState(() {
      _experssion = temExpress;
    });
  }

  void evaluate(String text) {
    ExpressionParser parser = GrammarParser();
    String tempExpress = _experssion.replaceAll('×', '*');
    //tempExpress = tempExpress.replaceAll('(', '');
    Expression expression = parser.parse(tempExpress);
    ContextModel contextModel = ContextModel();
    var evaluator = RealEvaluator(contextModel);
    setState(() {
      _history = _experssion;
      num result = evaluator.evaluate(expression);
      if (!(result is double && result != result.toInt())) {
        result = result.round();
      }
      _experssion = result.toString();
    });
  }

  void numberSelection(String text) {
    setState(() {
      _experssion += text;
    });
  }

  @override
  Widget build(BuildContext context) {
    var children = [
      Container(
        alignment: Alignment(1.0, 1.0),
        child: Padding(
          padding: EdgeInsets.only(right: 12),
          child: Text(
            _history,
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
            _experssion,
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(fontSize: 48, color: Colors.white),
            ),
          ),
        ),
      ),
      Container(
        alignment: Alignment(1.0, 1.0),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: ElevatedButton(
            onPressed: () {
              clearOnce();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 15, 20, 20),
              foregroundColor: Colors.green,
            ),
            child: Icon(Icons.backspace),
          ),
        ),
      ),
      Divider(
        color: Colors.grey, // Color of the line
        height: 20, // Total height occupied by the divider (including padding)
        thickness: 1, // Thickness of the line itself
        indent: 16, // Indent from the start of the line
        endIndent: 16, // Indent from the end of the line
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CalcButton(
            callback: allClear,
            text: "AC",
            textSize: 20,
            color: _primaryColor,
          ),
          CalcButton(
            callback: addParentheses,
            text: "()",
            textSize: 20,
            color: _primaryColor,
          ),
          CalcButton(
            callback: numberSelection,
            text: "%",
            textSize: 20,
            color: _primaryColor,
          ),
          CalcButton(
            callback: numberSelection,
            text: "/",
            textSize: 20,
            color: _secondaryColor,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CalcButton(
            callback: numberSelection,
            text: "7",
            textSize: 20,
            color: _baseColor,
          ),
          CalcButton(
            callback: numberSelection,
            text: "8",
            textSize: 20,
            color: _baseColor,
          ),
          CalcButton(
            callback: numberSelection,
            text: "9",
            textSize: 20,
            color: _baseColor,
          ),
          CalcButton(
            callback: numberSelection,
            text: "×",
            textSize: 28,
            color: _secondaryColor,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CalcButton(
            callback: numberSelection,
            text: "4",
            textSize: 20,
            color: _baseColor,
          ),
          CalcButton(
            callback: numberSelection,
            text: "5",
            textSize: 20,
            color: _baseColor,
          ),
          CalcButton(
            callback: numberSelection,
            text: "6",
            textSize: 20,
            color: _baseColor,
          ),
          CalcButton(
            callback: numberSelection,
            text: "-",
            textSize: 20,
            color: _secondaryColor,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CalcButton(
            callback: numberSelection,
            text: "1",
            textSize: 20,
            color: _baseColor,
          ),
          CalcButton(
            callback: numberSelection,
            text: "2",
            textSize: 20,
            color: _baseColor,
          ),
          CalcButton(
            callback: numberSelection,
            text: "3",
            textSize: 20,
            color: _baseColor,
          ),
          CalcButton(
            callback: numberSelection,
            text: "+",
            textSize: 20,
            color: _secondaryColor,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CalcButton(
            callback: changeSing,
            text: "+/-",
            textSize: 20,
            color: _baseColor,
          ),
          CalcButton(
            callback: numberSelection,
            text: "0",
            textSize: 20,
            color: _baseColor,
          ),
          CalcButton(
            callback: numberSelection,
            text: ".",
            textSize: 20,
            color: _baseColor,
          ),
          CalcButton(
            callback: evaluate,
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
