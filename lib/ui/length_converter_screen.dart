/*
 * Created by Yudi Setiawan on 1/28/19 3:33 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 1/28/19 3:32 PM
 */

import 'dart:io';

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
                                child: buildRaisedButtonGeneralCalculator(
                                  label: "7",
                                  labelColor: Colors.grey,
                                  buttonColor: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: buildRaisedButtonGeneralCalculator(
                                  label: "8",
                                  labelColor: Colors.grey,
                                  buttonColor: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: buildRaisedButtonGeneralCalculator(
                                  label: "9",
                                  labelColor: Colors.grey,
                                  buttonColor: Colors.white,
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
                                child: buildRaisedButtonGeneralCalculator(
                                  label: "4",
                                  labelColor: Colors.grey,
                                  buttonColor: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: buildRaisedButtonGeneralCalculator(
                                  label: "5",
                                  labelColor: Colors.grey,
                                  buttonColor: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: buildRaisedButtonGeneralCalculator(
                                  label: "6",
                                  labelColor: Colors.grey,
                                  buttonColor: Colors.white,
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
                                child: buildRaisedButtonGeneralCalculator(
                                  label: "1",
                                  labelColor: Colors.grey,
                                  buttonColor: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: buildRaisedButtonGeneralCalculator(
                                  label: "2",
                                  labelColor: Colors.grey,
                                  buttonColor: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: buildRaisedButtonGeneralCalculator(
                                  label: "3",
                                  labelColor: Colors.grey,
                                  buttonColor: Colors.white,
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
                                child: buildRaisedButtonGeneralCalculator(
                                  label: "0",
                                  labelColor: Colors.grey,
                                  buttonColor: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: buildRaisedButtonGeneralCalculator(
                                  label: ".",
                                  labelColor: Colors.grey,
                                  buttonColor: Colors.white,
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
                          child: buildRaisedButtonClearCalculator(),
                        ),
                        Expanded(
                          child: buildRaisedButtonBackspaceCalculator(),
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

  RaisedButton buildRaisedButtonBackspaceCalculator() {
    return RaisedButton(
      color: Colors.white,
      highlightColor: Colors.grey[800],
      child: Icon(
        Icons.backspace,
        color: Colors.grey,
      ),
      onPressed: () {
        // TODO: do something in here
      },
    );
  }

  RaisedButton buildRaisedButtonClearCalculator() {
    return RaisedButton(
      color: Colors.white,
      highlightColor: Colors.grey[800],
      child: Text(
        "C",
        style: TextStyle(
          color: Colors.orange,
          fontSize: 24.0,
        ),
      ),
      onPressed: () {
        // TODO: do something in here
      },
    );
  }

}
