/*
 * Created by Yudi Setiawan on 1/9/19 8:28 AM
 * Copyright (c) 2019. All right reserved.
 * Last modified 1/9/19 8:27 AM
 */

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final Color _primarySwatchColor = Colors.orange;

void main() =>
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {
      runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: _primarySwatchColor),
        home: MainApp(),
      ));
    });

class MainApp extends StatefulWidget {
  @override
  MainAppState createState() => MainAppState();

/*@override
  TestingTabState createState() => TestingTabState();*/
}

class TestingTabState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class MainAppState extends State<MainApp> {
  final double _padding = 16.0;
  final double _buttonFontSizeCalculator = 24.0;
  final double _buttonFontSizeConverter = 16.0;
  final double _buttonOpacityConverter = 0.5;
  final double _imageSizeConverter = 36.0;
  final double _borderWidthConverter = 0.5;
  final String _titleAppBar = "Basic Calculator";

  final Color _titleAppBarColor = Colors.white;
  final Color _buttonColorWhite = Colors.white;
  final Color _buttonHighlightColor = Colors.grey[800];
  final Color _textColorGrey = Colors.grey;
  final Color _textColorWhite = Colors.white;
  final Color _borderColorConverter = Colors.grey[200];

  double valueA;
  double valueB;
  var sbValue = new StringBuffer();
  String operator;

  void appendSbValue(String str) => setState(() {
        bool isDoCalculate = false;
        String strValue = sbValue.toString();
        String lastCharacter = strValue.substring(strValue.length - 1);
        String strValueA =
            operator.isEmpty ? strValue : strValue.split(operator)[0];
        String strValueB = operator.isEmpty ? "" : strValue.split(operator)[1];
        if ((strValue == "0" && str == "0") ||
            ((lastCharacter == "/" ||
                    lastCharacter == "x" ||
                    lastCharacter == "-" ||
                    lastCharacter == "+") &&
                str == ".")) {
          return;
        } else if (operator.isEmpty && str == "." && strValueA.contains(".")) {
          return;
        } else if (operator.isNotEmpty &&
            str == "." &&
            strValueB.contains(".")) {
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
          if (sbValue.toString() == "0" && str != "0" && str != ".") {
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
            valueA = double.parse(values[0]);
            valueB = double.parse(values[1]);
            sbValue.clear();
            double total = 0;
            switch (operator) {
              case "/":
                total = valueA / valueB;
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
            var strTotal = total.toString();
            var strDecimalValue = strTotal.split("\.");
            if (strDecimalValue[1].length == 1 &&
                strDecimalValue[1][0] == "0") {
              strTotal = "${total.toInt()}";
            }
            sbValue.write(strTotal);
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
        buildConverterLayout(),
      ],
    );
  }

  buildConverterLayout() {
    var mediaQueryData = MediaQuery.of(context);

    final double statusBarHeight = mediaQueryData.padding.top;
    final double bottomBarHeight = mediaQueryData.padding.bottom;
    final double barHeight = statusBarHeight + bottomBarHeight;
    final double appBarHeight = kToolbarHeight + kTextTabBarHeight;
    final double itemWidth = mediaQueryData.size.width / 3;
    final double itemHeight =
        (mediaQueryData.size.height - appBarHeight - barHeight) / 3;

    return SafeArea(
      bottom: false,
      child: GridView.count(
        childAspectRatio: (itemWidth / itemHeight),
        crossAxisCount: 3,
        controller: ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: _buttonColorWhite,
              border: Border.all(
                color: _borderColorConverter,
                width: _borderWidthConverter,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Opacity(
                    opacity: _buttonOpacityConverter,
                    child: Image.asset(
                      "assets/icons/icons8_us_dollar_100.png",
                      width: _imageSizeConverter,
                      height: _imageSizeConverter,
                    ),
                  ),
                ),
                Text(
                  "Currency",
                  style: TextStyle(
                      color: _textColorGrey,
                      fontSize: _buttonFontSizeConverter),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: _buttonColorWhite,
              border: Border.all(
                color: _borderColorConverter,
                width: _borderWidthConverter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Opacity(
                    opacity: _buttonOpacityConverter,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(45 / 360),
                      child: Image.asset(
                        "assets/icons/icons8_length_filled_100.png",
                        width: _imageSizeConverter,
                        height: _imageSizeConverter,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Length",
                  style: TextStyle(
                    color: _textColorGrey,
                    fontSize: _buttonFontSizeConverter,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: _buttonColorWhite,
              border: Border.all(
                color: _borderColorConverter,
                width: _borderWidthConverter,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Opacity(
                    opacity: _buttonOpacityConverter,
                    child: Image.asset(
                      "assets/icons/icons8_map_100.png",
                      width: _imageSizeConverter,
                      height: _imageSizeConverter,
                    ),
                  ),
                ),
                Text(
                  "Area",
                  style: TextStyle(
                    color: _textColorGrey,
                    fontSize: _buttonFontSizeConverter,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: _buttonColorWhite,
              border: Border.all(
                color: _borderColorConverter,
                width: _borderWidthConverter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Opacity(
                    opacity: _buttonOpacityConverter,
                    child: Image.asset(
                      "assets/icons/icons8_sugar_cube_100.png",
                      width: _imageSizeConverter,
                      height: _imageSizeConverter,
                    ),
                  ),
                ),
                Text(
                  "Volume",
                  style: TextStyle(
                    color: _textColorGrey,
                    fontSize: _buttonFontSizeConverter,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: _buttonColorWhite,
              border: Border.all(
                color: _borderColorConverter,
                width: _borderWidthConverter,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Opacity(
                    opacity: _buttonOpacityConverter,
                    child: Image.asset(
                      "assets/icons/icons8_temperature_100.png",
                      width: _imageSizeConverter,
                      height: _imageSizeConverter,
                    ),
                  ),
                ),
                Text(
                  "Temperature",
                  style: TextStyle(
                    color: _textColorGrey,
                    fontSize: _buttonFontSizeConverter,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: _buttonColorWhite,
              border: Border.all(
                color: _borderColorConverter,
                width: _borderWidthConverter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Opacity(
                    opacity: _buttonOpacityConverter,
                    child: Image.asset(
                      "assets/icons/icons8_speed_100.png",
                      width: _imageSizeConverter,
                      height: _imageSizeConverter,
                    ),
                  ),
                ),
                Text(
                  "Speed",
                  style: TextStyle(
                    color: _textColorGrey,
                    fontSize: _buttonFontSizeConverter,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: _buttonColorWhite,
              border: Border.all(
                color: _borderColorConverter,
                width: _borderWidthConverter,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Opacity(
                    opacity: _buttonOpacityConverter,
                    child: Image.asset(
                      "assets/icons/icons8_clock_100.png",
                      width: _imageSizeConverter,
                      height: _imageSizeConverter,
                    ),
                  ),
                ),
                Text(
                  "Time",
                  style: TextStyle(
                    color: _textColorGrey,
                    fontSize: _buttonFontSizeConverter,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: _buttonColorWhite,
                border: Border.all(
                  color: _borderColorConverter,
                  width: _borderWidthConverter,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Opacity(
                    opacity: _buttonOpacityConverter,
                    child: Image.asset(
                      "assets/icons/icons8_weight_100.png",
                      width: _imageSizeConverter,
                      height: _imageSizeConverter,
                    ),
                  ),
                ),
                Text(
                  "Mass",
                  style: TextStyle(
                    color: _textColorGrey,
                    fontSize: _buttonFontSizeConverter,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildCalculatorLayout() {
    return SafeArea(
      child: Column(
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
                        flex: 2,
                        child: buildRaisedButtonGeneralCalculator(
                          label: "0",
                          labelColor: _textColorGrey,
                          buttonColor: _buttonColorWhite,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildRaisedButtonGeneralCalculator(
                          label: ".",
                          labelColor: _textColorGrey,
                          buttonColor: _buttonColorWhite,
                        ),
                      ),
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
      ),
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
