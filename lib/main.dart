/*
 * Created by Yudi Setiawan on 2/3/19 10:17 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 2/3/19 10:05 PM
 */

import 'package:auto_size_text/auto_size_text.dart';
import 'package:basic_calculator_app/ui/area_converter_screen.dart';
import 'package:basic_calculator_app/ui/currency_converter_screen.dart';
import 'package:basic_calculator_app/ui/length_converter_screen.dart';
import 'package:basic_calculator_app/ui/mass_converter_screen.dart';
import 'package:basic_calculator_app/ui/speed_converter_screen.dart';
import 'package:basic_calculator_app/ui/temperature_converter_screen.dart';
import 'package:basic_calculator_app/ui/time_converter_screen.dart';
import 'package:basic_calculator_app/ui/volume_converter_screen.dart';
import 'package:basic_calculator_app/utils/button_calculator.dart';
import 'package:basic_calculator_app/values/color_assets.dart';
import 'package:basic_calculator_app/values/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() =>
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {
      runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: ColorAssets.primarySwatchColor),
        home: MainApp(),
      ));
    });

class MainApp extends StatefulWidget {
  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  final double _buttonFontSizeConverter = 16.0;
  final double _buttonOpacityConverter = 0.5;
  final double _imageSizeConverter = 36.0;
  final double _borderWidthConverter = 0.5;
  final String _titleAppBar = "Basic Calculator";

  final Color _buttonColorWhite = Colors.white;
  final Color _textColorGrey = Colors.grey;
  final Color _borderColorConverter = Colors.grey[200];

  double valueA;
  double valueB;
  var sbValue = new StringBuffer();
  String operator;

  VoidNavigate _appendSbValue(String str) {
    setState(() {
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
      } else if (operator.isNotEmpty && str == "." && strValueB.contains(".")) {
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
          if (strDecimalValue[1].length == 1 && strDecimalValue[1][0] == "0") {
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
              sbValue
                  .write(strValue.substring(0, strValue.length - 1) + "" + str);
              operator = str;
            }
          }
        }
      }
    });
  }

  VoidCallback _deleteSbValue() {
    setState(() {
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
  }

  VoidCallback _clearSbValue() {
    setState(() {
      operator = "";
      sbValue.clear();
      sbValue.write("0");
    });
  }

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
          color: ColorAssets.titleAppBarColor,
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
          GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CurrencyConverterScreen();
                })),
            child: buildContainerMenuConverter(
              Key("container_menu_currency"),
              "assets/icons/icons8_us_dollar_100.png",
              "Currency",
            ),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LengthConverterScreen();
                })),
            child: buildContainerMenuConverter(
              Key("container_menu_length"),
              "assets/icons/icons8_length_filled_100.png",
              "Length",
            ),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AreaConverterScreen();
                })),
            child: buildContainerMenuConverter(
              Key("container_menu_area"),
              "assets/icons/icons8_map_100.png",
              "Area",
            ),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VolumeConverterScreen();
                })),
            child: buildContainerMenuConverter(
              Key("container_menu_volume"),
              "assets/icons/icons8_sugar_cube_100.png",
              "Volume",
            ),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TemperatureConverterScreen();
                })),
            child: buildContainerMenuConverter(
              Key("container_menu_temperature"),
              "assets/icons/icons8_temperature_100.png",
              "Temperature",
            ),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SpeedConverterScreen();
                })),
            child: buildContainerMenuConverter(
              Key("container_menu_speed"),
              "assets/icons/icons8_speed_100.png",
              "Speed",
            ),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TimeConverterScreen();
                })),
            child: buildContainerMenuConverter(
              Key("container_menu_time"),
              "assets/icons/icons8_clock_100.png",
              "Time",
            ),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MassConverterScreen();
                })),
            child: buildContainerMenuConverter(
              Key("container_menu_mass"),
              "assets/icons/icons8_weight_100.png",
              "Mass",
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
              padding: EdgeInsets.all(Dimens.padding16),
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
                        child: ButtonCalculator(
                          "clear",
                          actionOnPressed: _clearSbValue,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ButtonCalculator(
                          "backspace",
                          actionOnPressed: _deleteSbValue,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ButtonCalculator(
                          "general",
                          actionOnPressedWithParameter: (String value) {
                            _appendSbValue(value);
                          },
                          valueActionOnPressedWithParameter: "/",
                          label: "/",
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
                        child: ButtonCalculator(
                          "general",
                          actionOnPressedWithParameter: (String value) {
                            _appendSbValue(value);
                          },
                          valueActionOnPressedWithParameter: "7",
                          label: "7",
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ButtonCalculator(
                          "general",
                          actionOnPressedWithParameter: (String value) {
                            _appendSbValue(value);
                          },
                          valueActionOnPressedWithParameter: "8",
                          label: "8",
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ButtonCalculator(
                          "general",
                          actionOnPressedWithParameter: (String value) {
                            _appendSbValue(value);
                          },
                          valueActionOnPressedWithParameter: "9",
                          label: "9",
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ButtonCalculator(
                          "general",
                          actionOnPressedWithParameter: (String value) {
                            _appendSbValue(value);
                          },
                          valueActionOnPressedWithParameter: "x",
                          label: "x",
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
                        child: ButtonCalculator(
                          "general",
                          actionOnPressedWithParameter: (String value) {
                            _appendSbValue(value);
                          },
                          valueActionOnPressedWithParameter: "4",
                          label: "4",
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ButtonCalculator(
                          "general",
                          actionOnPressedWithParameter: (String value) {
                            _appendSbValue(value);
                          },
                          valueActionOnPressedWithParameter: "5",
                          label: "5",
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ButtonCalculator(
                          "general",
                          actionOnPressedWithParameter: (String value) {
                            _appendSbValue(value);
                          },
                          valueActionOnPressedWithParameter: "6",
                          label: "6",
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ButtonCalculator(
                          "general",
                          actionOnPressedWithParameter: (String value) {
                            _appendSbValue(value);
                          },
                          valueActionOnPressedWithParameter: "-",
                          label: "-",
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
                        child: ButtonCalculator(
                          "general",
                          actionOnPressedWithParameter: (String value) {
                            _appendSbValue(value);
                          },
                          valueActionOnPressedWithParameter: "1",
                          label: "1",
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ButtonCalculator(
                          "general",
                          actionOnPressedWithParameter: (String value) {
                            _appendSbValue(value);
                          },
                          valueActionOnPressedWithParameter: "2",
                          label: "2",
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ButtonCalculator(
                          "general",
                          actionOnPressedWithParameter: (String value) {
                            _appendSbValue(value);
                          },
                          valueActionOnPressedWithParameter: "3",
                          label: "3",
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ButtonCalculator(
                          "general",
                          actionOnPressedWithParameter: (String value) {
                            _appendSbValue(value);
                          },
                          valueActionOnPressedWithParameter: "+",
                          label: "+",
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
                        child: ButtonCalculator(
                          "general",
                          actionOnPressedWithParameter: (String value) {
                            _appendSbValue(value);
                          },
                          valueActionOnPressedWithParameter: "0",
                          label: "0",
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ButtonCalculator(
                          "general",
                          actionOnPressedWithParameter: (String value) {
                            _appendSbValue(value);
                          },
                          valueActionOnPressedWithParameter: ".",
                          label: ".",
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ButtonCalculator(
                          "general",
                          actionOnPressedWithParameter: (String value) {
                            _appendSbValue(value);
                          },
                          valueActionOnPressedWithParameter: "=",
                          label: "=",
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

  Widget buildContainerMenuConverter(
      Key key, String pathImage, String labelMenu) {
    return Container(
      key: key,
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
            padding: EdgeInsets.all(Dimens.padding16),
            child: Opacity(
              opacity: _buttonOpacityConverter,
              child: Image.asset(
                pathImage,
                width: _imageSizeConverter,
                height: _imageSizeConverter,
              ),
            ),
          ),
          Text(
            labelMenu,
            style: TextStyle(
              color: _textColorGrey,
              fontSize: _buttonFontSizeConverter,
            ),
          )
        ],
      ),
    );
  }
}
