import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as math;
import 'package:calculator/config.dart';

class SimpleCalculator extends StatefulWidget {

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  String save = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == "C"){
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      }
      else if(buttonText == "sv"){
        if(save == ""){
          save = result;
        } else {
          equation += save;
          save = "";
        }
      }
      else if(buttonText == "⌫"){
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        for(;;){
          equation = equation.substring(0, equation.length - 1);
          if(equation == ""){
              equation = "0";
              break;
          }
          if("1234567890()".contains(equation[equation.length - 1])){
            break;
          }
        }
      }
      else if(buttonText == "="){
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('pi', math.pi.toStringAsFixed(5).toString());

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result = "Error";
        }
      }
      else{
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if(equation == "0"){
          equation = "";
        }
        if (buttonText == "cs"){
          buttonText = "cos(";
        }
        else if (buttonText == "sn"){
          buttonText = "sin(";
        }
        else if (buttonText == "||"){
          buttonText = "abs(";
        }
        else if (buttonText == "^2"){
          buttonText = "sqrt(";
        }
        else if (buttonText == "ln"){
          buttonText = "ln10";
        }
        else if (buttonText == "tn"){
          buttonText = "tan(";
        }
        else if (buttonText == "🍺"){
          buttonText = "🍺🍺🍺зачтите лабу🍺🍺🍺";
        }
        equation += buttonText;
      }
    });
  }
  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      child: FloatingActionButton(
        backgroundColor: buttonColor,
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.white
          ),
        )
      ),
    );
  }

  Widget portairt(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation, style: TextStyle(fontSize: equationFontSize, color: Colors.orangeAccent),),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result, style: TextStyle(fontSize: resultFontSize, color: Colors.orangeAccent),),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("C", 1, Colors.orangeAccent),
                        buildButton("⌫", 1, Colors.orangeAccent),
                        buildButton("÷", 1, Colors.orangeAccent),
                        buildButton("×", 1, Colors.orangeAccent),
                      ]
                    ),
                    TableRow(
                        children: [
                          buildButton("7", 1, Colors.grey[900]),
                          buildButton("8", 1, Colors.grey[900]),
                          buildButton("9", 1, Colors.grey[900]),
                          buildButton("-", 1, Colors.orangeAccent),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("4", 1, Colors.grey[900]),
                          buildButton("5", 1, Colors.grey[900]),
                          buildButton("6", 1, Colors.grey[900]),
                          buildButton("+", 1, Colors.orangeAccent),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("1", 1, Colors.grey[900]),
                          buildButton("2", 1, Colors.grey[900]),
                          buildButton("3", 1, Colors.grey[900]),
                          buildButton("=", 1, Colors.orangeAccent),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton(".", 1, Colors.grey[900]),
                          buildButton("0", 1, Colors.grey[900]),
                          buildButton("00", 1, Colors.grey[900]),
                          buildButton("=", 1, Colors.orangeAccent),
                        ]
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      );
  }

  Widget landscape(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation, style: TextStyle(fontSize: equationFontSize, color: Colors.orangeAccent),),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result, style: TextStyle(fontSize: resultFontSize, color: Colors.orangeAccent),),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          buildButton("7", 1, Colors.grey[900]),
                          buildButton("8", 1, Colors.grey[900]),
                          buildButton("9", 1, Colors.grey[900]),
                          buildButton("C", 1, Colors.orangeAccent),
                          buildButton("sv", 1, Colors.orangeAccent),
                          buildButton("||", 1, Colors.orangeAccent),
                          buildButton("⌫", 1, Colors.orangeAccent),
                          buildButton("=", 1, Colors.orangeAccent),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("4", 1, Colors.grey[900]),
                          buildButton("5", 1, Colors.grey[900]),
                          buildButton("6", 1, Colors.grey[900]),
                          buildButton("+", 1, Colors.orangeAccent),
                          buildButton("×", 1, Colors.orangeAccent),
                          buildButton("ln", 1, Colors.orangeAccent),
                          buildButton("^2", 1, Colors.orangeAccent),
                          buildButton("pi", 1, Colors.orangeAccent),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("1", 1, Colors.grey[900]),
                          buildButton("2", 1, Colors.grey[900]),
                          buildButton("3", 1, Colors.grey[900]),
                          buildButton("-", 1, Colors.orangeAccent),
                          buildButton("÷", 1, Colors.orangeAccent),
                          buildButton("^", 1, Colors.orangeAccent),
                          buildButton("(", 1, Colors.orangeAccent),
                          buildButton(")", 1, Colors.orangeAccent),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton(".", 1, Colors.grey[900]),
                          buildButton("0", 1, Colors.grey[900]),
                          buildButton("00", 1, Colors.grey[900]),
                          buildButton("sn", 1, Colors.orangeAccent),
                          buildButton("cs", 1, Colors.orangeAccent),
                          buildButton("tn", 1, Colors.orangeAccent),
                          buildButton("e", 1, Colors.orangeAccent),
                          buildButton("🍺", 1, Colors.orangeAccent),
                        ]
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Calculator ' + Config.message, style: TextStyle(color: Colors.orangeAccent, fontSize: 24), textAlign: TextAlign.center), backgroundColor: Colors.black,),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.landscape
              ? landscape(context)
              : portairt(context);
        },
      ),
    );
  }
}