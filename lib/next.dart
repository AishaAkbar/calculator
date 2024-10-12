import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:part_2_calculator/constant.dart';

class MyCal extends StatefulWidget {
  const MyCal({super.key});

  @override
  State<MyCal> createState() => _MyCalState();
}

class _MyCalState extends State<MyCal> {
  var UserInput = '';
  var Answer = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('CALCULATOR'),
            backgroundColor: Colors.blue,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Column(
                  children: [
                    Text(
                      UserInput.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Text(
                      Answer.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(children: [
                  Row(
                    children: [
                      MyButton(
                        title: 'AC',
                        onpress: () {
                          UserInput = '';
                          Answer = '';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '+/-',
                        onpress: () {
                          UserInput += '+/-';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '%',
                        onpress: () {
                          UserInput += '%';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '/',
                        color: Color(0xffffa00a),
                        onpress: () {
                          UserInput += '/';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '7',
                        onpress: () {
                          UserInput += '7';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '8',
                        onpress: () {
                          UserInput += '8';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '0',
                        onpress: () {
                          UserInput += '0';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: 'x',
                        color: Color(0xffffa00a),
                        onpress: () {
                          UserInput = 'x';
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '4',
                        onpress: () {
                          UserInput += '4';
                        },
                      ),
                      MyButton(
                        title: '5',
                        onpress: () {
                          UserInput += '5';
                        },
                      ),
                      MyButton(
                        title: '6',
                        onpress: () {
                          UserInput += '6';
                        },
                      ),
                      MyButton(
                        title: '-',
                        color: Color(0xffffa00a),
                        onpress: () {
                          UserInput += '-';
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '1',
                        onpress: () {
                          UserInput += '1';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '2',
                        onpress: () {
                          UserInput += '2';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '3',
                        onpress: () {
                          UserInput += '3';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '+',
                        color: Color(0xffffa00a),
                        onpress: () {
                          UserInput += '+';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '0',
                        onpress: () {
                          UserInput += '0';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '.',
                        onpress: () {
                          UserInput += '.';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: 'DEL',
                        onpress: () {
                          UserInput +=
                              UserInput.substring(0, UserInput.length - 1);
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '=',
                        color: Color(0xffffa00a),
                        onpress: () {
                          equalpress();
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          )),
    );
  }

  void equalpress() {
    var finalUserInput = UserInput;
    finalUserInput = UserInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    Answer = eval.toString();
  }
}

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onpress;
  const MyButton(
      {super.key,
      required this.title,
      this.color = const Color(0xffa5a5a5),
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: InkWell(
              onTap: onpress,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    title,
                    style: wordsText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
