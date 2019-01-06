/*
 * Created by Yudi Setiawan on 1/6/19 11:16 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 1/6/19 11:15 PM
 */

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

final Color _primarySwatchColor = Colors.orange;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: _primarySwatchColor),
      home: MainApp(),
    ));

class MainApp extends StatefulWidget {
  @override
  MainAppState createState() => MainAppState();

/*@override
  TestingTabState createState() => TestingTabState();*/
}

class TestingTabState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Basic Calculator",
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: <Widget>[
              Tab(text: "Calculator"),
              Tab(text: "Converter"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}

class MainAppState extends State<MainApp> {
  final double _padding = 16.0;
  final double _buttonFontSizeCalculator = 24.0;
  final String _titleAppBar = "Basic Calculator";

  final Color _titleAppBarColor = Colors.white;
  final Color _buttonColorWhite = Colors.white;
  final Color _buttonHighlightColor = Colors.grey[800];
  final Color _textColorGrey = Colors.grey;
  final Color _textColorWhite = Colors.white;

  int valueA;
  int valueB;
  var sbValue = new StringBuffer();
  String operator;

  void appendSbValue(String str) => setState(() {
        bool isDoCalculate = false;
        String strValue = sbValue.toString();
        String lastCharacter = strValue.substring(strValue.length - 1);
        if ((strValue == "0" && str == "0") ||
            ((lastCharacter == "/" ||
                    lastCharacter == "x" ||
                    lastCharacter == "-" ||
                    lastCharacter == "+") &&
                str == "0")) {
          return;
        } else if (str == "=") {
          isDoCalculate = true;
        } else if (str == "/" || str == "x" || str == "-" || str == "+") {
          if (operator.isEmpty) {
            operator = str;
          } else {
            isDoCalculate = true;
          }
        }

        if (!isDoCalculate) {
          if (sbValue.toString() == "0" && str != "0") {
            if (str != "/" && str != "x" && str != "-" && str != "+") {
              sbValue.clear();
            }
            sbValue.write(str);
          } else {
            sbValue.write(str);
          }
        } else {
          List<String> values = sbValue.toString().split(operator);
          if (values.length == 2 &&
              values[0].isNotEmpty &&
              values[1].isNotEmpty) {
            valueA = int.parse(values[0]);
            valueB = int.parse(values[1]);
            sbValue.clear();
            int total = 0;
            switch (operator) {
              case "/":
                total = valueA ~/ valueB;
                break;
              case "x":
                total = valueA * valueB;
                break;
              case "-":
                total = valueA - valueB;
                break;
              case "+":
                total = valueA + valueB;
            }
            sbValue.write(total);
            if (str == "/" || str == "x" || str == "-" || str == "+") {
              operator = str;
              sbValue.write(str);
            } else {
              operator = "";
            }
          } else {
            String strValue = sbValue.toString();
            String lastCharacter = strValue.substring(strValue.length - 1);
            if (str == "=") {
              if (lastCharacter == "/" ||
                  lastCharacter == "x" ||
                  lastCharacter == "-" ||
                  lastCharacter == "+") {
                operator = "";
                sbValue.clear();
                sbValue.write(strValue.substring(0, strValue.length - 1));
              }
            } else {
              if (str == "/" || str == "x" || str == "-" || str == "+") {
                sbValue.clear();
                sbValue.write(
                    strValue.substring(0, strValue.length - 1) + "" + str);
                operator = str;
              }
            }
          }
        }
      });

  void deleteSbValue() => setState(() {
        String strValue = sbValue.toString();
        if (strValue.length > 0) {
          String lastCharacter = strValue.substring(strValue.length - 1);
          if (lastCharacter == "/" ||
              lastCharacter == "x" ||
              lastCharacter == "-" ||
              lastCharacter == "+") {
            operator = "";
          }
          strValue = strValue.substring(0, strValue.length - 1);
          sbValue.clear();
          sbValue.write(strValue.length == 0 ? "0" : strValue);
        }
      });

  void clearSbValue() => setState(() {
        operator = "";
        sbValue.clear();
        sbValue.write("0");
      });

  @override
  void initState() {
    super.initState();
    sbValue.write("0");
    operator = "";
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildTabBar(),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      title: Text(
        _titleAppBar,
        style: TextStyle(
          color: _titleAppBarColor,
        ),
      ),
      bottom: TabBar(
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        tabs: <Widget>[
          Tab(text: "Calculator"),
          Tab(text: "Converter"),
        ],
      ),
    );
  }

  buildTabBar() {
    return TabBarView(
      children: <Widget>[
        buildCalculatorLayout(),
        Center(
          child: Text("Coming soon"),
        ),
      ],
    );
  }

  buildCalculatorLayout() {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(_padding),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                AutoSizeText(
                  sbValue.toString(),
                  style: Theme.of(context).textTheme.display2,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: buildRaisedButtonClearCalculator(),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildRaisedButtonBackspaceCalculator(),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildRaisedButtonGeneralCalculator(
                        label: "/",
                        labelColor: _textColorGrey,
                        buttonColor: _buttonColorWhite,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: buildRaisedButtonGeneralCalculator(
                        label: "7",
                        labelColor: _textColorGrey,
                        buttonColor: _buttonColorWhite,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildRaisedButtonGeneralCalculator(
                        label: "8",
                        labelColor: _textColorGrey,
                        buttonColor: _buttonColorWhite,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildRaisedButtonGeneralCalculator(
                        label: "9",
                        labelColor: _textColorGrey,
                        buttonColor: _buttonColorWhite,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildRaisedButtonGeneralCalculator(
                        label: "x",
                        labelColor: _textColorGrey,
                        buttonColor: _buttonColorWhite,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: buildRaisedButtonGeneralCalculator(
                        label: "4",
                        labelColor: _textColorGrey,
                        buttonColor: _buttonColorWhite,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildRaisedButtonGeneralCalculator(
                        label: "5",
                        labelColor: _textColorGrey,
                        buttonColor: _buttonColorWhite,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildRaisedButtonGeneralCalculator(
                        label: "6",
                        labelColor: _textColorGrey,
                        buttonColor: _buttonColorWhite,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildRaisedButtonGeneralCalculator(
                        label: "-",
                        labelColor: _textColorGrey,
                        buttonColor: _buttonColorWhite,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: buildRaisedButtonGeneralCalculator(
                        label: "1",
                        labelColor: _textColorGrey,
                        buttonColor: _buttonColorWhite,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildRaisedButtonGeneralCalculator(
                        label: "2",
                        labelColor: _textColorGrey,
                        buttonColor: _buttonColorWhite,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildRaisedButtonGeneralCalculator(
                        label: "3",
                        labelColor: _textColorGrey,
                        buttonColor: _buttonColorWhite,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildRaisedButtonGeneralCalculator(
                        label: "+",
                        labelColor: _textColorGrey,
                        buttonColor: _buttonColorWhite,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: buildRaisedButtonGeneralCalculator(
                        label: "0",
                        labelColor: _textColorGrey,
                        buttonColor: _buttonColorWhite,
                      ),
                    ),
                    /*Expanded(
                      flex: 1,
                      child: RaisedButton(
                        color: _buttonColorWhite,
                        highlightColor: _buttonHighlightColor,
                        child: Text(
                          ".",
                          style: TextStyle(
                            color: _buttonColorGrey,
                            fontSize: _buttonFontSize,
                          ),
                        ),
                        onPressed: () {
                          // TODO: do something in here when button . pressed
                        },
                      ),
                    ),*/
                    Expanded(
                      flex: 1,
                      child: buildRaisedButtonGeneralCalculator(
                        label: "=",
                        labelColor: _textColorWhite,
                        buttonColor: _primarySwatchColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  RaisedButton buildRaisedButtonGeneralCalculator({
    String label,
    Color labelColor,
    Color buttonColor,
  }) {
    return RaisedButton(
      color: buttonColor,
      highlightColor: _buttonHighlightColor,
      child: Text(
        label,
        style: TextStyle(
          color: labelColor,
          fontSize: _buttonFontSizeCalculator,
        ),
      ),
      onPressed: () {
        appendSbValue(label);
      },
    );
  }

  RaisedButton buildRaisedButtonBackspaceCalculator() {
    return RaisedButton(
      color: _buttonColorWhite,
      highlightColor: _buttonHighlightColor,
      child: Icon(
        Icons.backspace,
        color: _textColorGrey,
      ),
      onPressed: () {
        deleteSbValue();
      },
    );
  }

  RaisedButton buildRaisedButtonClearCalculator() {
    return RaisedButton(
      color: _buttonColorWhite,
      highlightColor: _buttonHighlightColor,
      child: Text(
        "C",
        style: TextStyle(
          color: _primarySwatchColor,
          fontSize: _buttonFontSizeCalculator,
        ),
      ),
      onPressed: () {
        clearSbValue();
      },
    );
  }
}
