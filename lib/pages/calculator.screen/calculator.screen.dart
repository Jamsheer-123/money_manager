import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String userInput = '';
  String answer = '';

  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      backgroundColor: Colors.white38,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userInput,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    answer,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (BuildContext context, int index) {
                return MyButton(
                  buttonText: buttons[index],
                  onTap: () => onButtonTap(buttons[index]),
                  color: isOperator(buttons[index])
                      ? Colors.blueAccent
                      : Colors.white,
                  textColor:
                      isOperator(buttons[index]) ? Colors.white : Colors.black,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void onButtonTap(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        userInput = '';
        answer = '0';
      } else if (buttonText == '=') {
        equalPressed();
      } else if (buttonText == 'DEL') {
        userInput = userInput.substring(0, userInput.length - 1);
      } else {
        userInput += buttonText;
      }
    });
  }

  bool isOperator(String x) {
    return x == '/' || x == 'x' || x == '-' || x == '+' || x == '=';
  }

  void equalPressed() {
    String finalUserInput = userInput.replaceAll('x', '*');

    try {
      Parser p = Parser();
      Expression exp = p.parse(finalUserInput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      answer = eval.toString();
    } catch (e) {
      answer = 'Error';
    }
  }
}

class MyButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;

  const MyButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height / 0.6,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 32.0, color: textColor),
        ),
      ),
    );
  }
}
