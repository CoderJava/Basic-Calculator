/*
 * Created by Yudi Setiawan on 1/20/19 10:51 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 1/20/19 10:50 PM
 */

import 'dart:io';

import 'package:flutter/material.dart';

class SpeedConverterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SpeedConverterScreenState();
}

class SpeedConverterScreenState extends State<SpeedConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Speed Converter",
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
