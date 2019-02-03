/*
 * Created by Yudi Setiawan on 2/3/19 10:19 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 2/3/19 10:16 PM
 */

import 'dart:io';

import 'package:basic_calculator_app/utils/button_calculator.dart';
import 'package:flutter/material.dart';

class LengthConverterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LengthConverterScreenState();
  }
}

class LengthConverterScreenState extends State<LengthConverterScreen> {
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
              child: Column(
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
                          Text("m"),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text("1"),
                              Text("Meter"),
                            ],
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
                          Text("cm"),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text("100"),
                              Text("Centimeter"),
                            ],
                          ),
                        ],
                      ),
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
              ),
            ),
          ],
        ),
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
      highlightColor: Colors.grey[800],
      child: Text(
        label,
        style: TextStyle(
          color: labelColor,
          fontSize: 24.0,
        ),
      ),
      onPressed: () {
        // TODO: do something in here
      },
    );
  }

  VoidCallback testing() {
    print("testing");
  }

}
