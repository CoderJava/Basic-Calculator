/*
 * Created by Yudi Setiawan on 1/20/19 10:47 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 1/20/19 10:47 PM
 */

import 'dart:io';

import 'package:flutter/material.dart';

class TemperatureConverterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TemperatureConverterScreenState();
}

class TemperatureConverterScreenState
    extends State<TemperatureConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Temperature Converter",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Center(
        child: Text("Coming soon"),
      ),
    );
  }
}
