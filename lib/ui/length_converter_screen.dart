/*
 * Created by Yudi Setiawan on 2/10/19 6:05 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 2/10/19 11:41 AM
 */

import 'dart:io';

import 'package:basic_calculator_app/utils/button_calculator.dart';
import 'package:basic_calculator_app/values/color_assets.dart';
import 'package:flutter/material.dart';

class LengthConverterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LengthConverterScreenState();
  }
}

class LengthConverterScreenState extends State<LengthConverterScreen> {
  String _positionPanelActive = "top";
  String _unitPanelTop = "m";
  String _unitPanelDown = "cm";
  String _unitDetailPanelTop = "Meter";
  String _unitDetailPanelDown = "Centimeter";
  int _indexPanelTop = 3;
  int _indexPanelDown = 5;
  int _valuePanelTop = 1;
  int _valuePanelDown = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Length Converter",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: buildPanelConverter(),
            ),
            Expanded(
              child: buildCalculatorLayout(),
            ),
          ],
        ),
      ),
    );
  }

  Row buildCalculatorLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: ButtonCalculator(
                        "general",
                        actionOnPressedWithParameter: (String value) {
                          // TODO: do something in here
                        },
                        valueActionOnPressedWithParameter: "7",
                        label: "7",
                      ),
                    ),
                    Expanded(
                      child: ButtonCalculator(
                        "general",
                        actionOnPressedWithParameter: (String value) {
                          // TODO: do something in here
                        },
                        valueActionOnPressedWithParameter: "8",
                        label: "8",
                      ),
                    ),
                    Expanded(
                      child: ButtonCalculator(
                        "general",
                        actionOnPressedWithParameter: (String value) {
                          // TODO: do something in here
                        },
                        valueActionOnPressedWithParameter: "9",
                        label: "9",
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: ButtonCalculator(
                        "general",
                        actionOnPressedWithParameter: (String value) {
                          // TODO: do something in here
                        },
                        valueActionOnPressedWithParameter: "4",
                        label: "4",
                      ),
                    ),
                    Expanded(
                      child: ButtonCalculator(
                        "general",
                        actionOnPressedWithParameter: (String value) {
                          // TODO: do something in here
                        },
                        valueActionOnPressedWithParameter: "5",
                        label: "5",
                      ),
                    ),
                    Expanded(
                      child: ButtonCalculator(
                        "general",
                        actionOnPressedWithParameter: (String value) {
                          // TODO: do something in here
                        },
                        valueActionOnPressedWithParameter: "6",
                        label: "6",
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: ButtonCalculator(
                        "general",
                        actionOnPressedWithParameter: (String value) {
                          // TODO: do something in here
                        },
                        valueActionOnPressedWithParameter: "1",
                        label: "1",
                      ),
                    ),
                    Expanded(
                      child: ButtonCalculator(
                        "general",
                        actionOnPressedWithParameter: (String value) {
                          // TODO: do something in here
                        },
                        valueActionOnPressedWithParameter: "2",
                        label: "2",
                      ),
                    ),
                    Expanded(
                      child: ButtonCalculator(
                        "general",
                        actionOnPressedWithParameter: (String value) {
                          // TODO: do something in here
                        },
                        valueActionOnPressedWithParameter: "3",
                        label: "3",
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: ButtonCalculator(
                        "general",
                        actionOnPressedWithParameter: (String value) {
                          // TODO: do something in here
                        },
                        valueActionOnPressedWithParameter: "0",
                        label: "0",
                      ),
                    ),
                    Expanded(
                      child: ButtonCalculator(
                        "general",
                        actionOnPressedWithParameter: (String value) {
                          // TODO: do something in here
                        },
                        valueActionOnPressedWithParameter: ".",
                        label: ".",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ButtonCalculator(
                  "clear",
                  actionOnPressed: testing,
                ),
              ),
              Expanded(
                child: ButtonCalculator(
                  "backspace",
                  actionOnPressed: testing,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column buildPanelConverter() {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
              left: 8.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            child: ListView(
                              children: <Widget>[
                                ListTile(
                                  title: Text("Kilometer"),
                                  subtitle: Text("km"),
                                  onTap: () {
                                    setState(() {
                                      _indexPanelTop = 0;
                                      _unitPanelTop = "km";
                                      _unitDetailPanelTop = "Kilometer";
                                      // TODO: do something in here
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text("Hektometer"),
                                  subtitle: Text("hm"),
                                  onTap: () {
                                    setState(() {
                                      _indexPanelTop = 1;
                                      _unitPanelTop = "hm";
                                      _unitDetailPanelTop = "Hektometer";
                                      // TODO: do something in here
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text("Dekameter"),
                                  subtitle: Text("dam"),
                                  onTap: () {
                                    setState(() {
                                      _indexPanelTop = 2;
                                      _unitPanelTop = "dam";
                                      _unitDetailPanelTop = "Dekameter";
                                      // TODO: do something in here
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text("Meter"),
                                  subtitle: Text("m"),
                                  onTap: () {
                                    setState(() {
                                      _indexPanelTop = 3;
                                      _unitPanelTop = "m";
                                      _unitDetailPanelTop = "Meter";
                                      // TODO: do something in here
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text("Desimeter"),
                                  subtitle: Text("dm"),
                                  onTap: () {
                                    setState(() {
                                      _indexPanelTop = 4;
                                      _unitPanelTop = "dm";
                                      _unitDetailPanelTop = "Desimeter";
                                      // TODO: do something in here
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text("Centimeter"),
                                  subtitle: Text("cm"),
                                  onTap: () {
                                    setState(() {
                                      _indexPanelTop = 5;
                                      _unitPanelTop = "cm";
                                      _unitDetailPanelTop = "Centimeter";
                                      // TODO: do something in here  
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text("Milimeter"),
                                  subtitle: Text("mm"),
                                  onTap: () {
                                    setState(() {
                                      _indexPanelTop = 6;
                                      _unitPanelTop = "mm";
                                      _unitDetailPanelTop = "Milimeter";
                                      // TODO: do something in here
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                  child: Text(
                    _unitPanelTop,
                    style: TextStyle(
                      fontSize: 28.0,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                        _positionPanelActive = "top";
                      }),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "1",
                        style: TextStyle(
                          fontSize: 28.0,
                          color: _positionPanelActive == "top"
                              ? ColorAssets.primarySwatchColor
                              : ColorAssets.primaryTextColor,
                        ),
                      ),
                      Text(_unitDetailPanelTop),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 8.0,
            left: 8.0,
          ),
          child: Divider(
            height: 1.0,
            color: Colors.grey,
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
              left: 8.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          child: ListView(
                            children: <Widget>[
                              ListTile(
                                title: Text("Kilometer"),
                                subtitle: Text("km"),
                                onTap: () {
                                  setState(() {
                                    _indexPanelDown = 0;
                                    _unitPanelDown = "km";
                                    _unitDetailPanelDown = "Kilometer";
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: Text("Hektometer"),
                                subtitle: Text("hm"),
                                onTap: () {
                                  setState(() {
                                    _indexPanelDown = 1;
                                    _unitPanelDown = "hm";
                                    _unitDetailPanelDown = "Hektometer";
                                    // TODO: do something in here  
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: Text("Dekameter"),
                                subtitle: Text("dam"),
                                onTap: () {
                                  setState(() {
                                    _indexPanelDown = 2;
                                    _unitPanelDown = "dam";
                                    _unitDetailPanelDown = "Dekameter";
                                    // TODO: do something in here  
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: Text("Meter"),
                                subtitle: Text("m"),
                                onTap: () {
                                  setState(() {
                                    _indexPanelDown = 3;
                                    _unitPanelDown = "m";
                                    _unitDetailPanelDown = "Meter";
                                    // TODO: do something in here  
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: Text("Desimeter"),
                                subtitle: Text("dm"),
                                onTap: () {
                                  setState(() {
                                    _indexPanelDown = 4;
                                    _unitPanelDown = "dm";
                                    _unitDetailPanelDown = "Desimeter";
                                    // TODO: do something in here  
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: Text("Centimeter"),
                                subtitle: Text("cm"),
                                onTap: () {
                                  setState(() {
                                    _indexPanelDown = 5;
                                    _unitPanelDown = "cm";
                                    _unitDetailPanelDown = "Centimeter";
                                    // TODO: do something in here
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: Text("Milimeter"),
                                subtitle: Text("mm"),
                                onTap: () {
                                  setState(() {
                                    _indexPanelDown = 6;
                                    _unitPanelDown = "mm";
                                    _unitDetailPanelDown = "Milimeter";
                                    // TODO: do something in here
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    _unitPanelDown,
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                        _positionPanelActive = "down";
                      }),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "100",
                        style: TextStyle(
                          fontSize: 28.0,
                          color: _positionPanelActive == "down"
                              ? ColorAssets.primarySwatchColor
                              : ColorAssets.primaryTextColor,
                        ),
                      ),
                      Text(_unitDetailPanelDown),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  VoidCallback testing() {
    print("testing");
  }
}
