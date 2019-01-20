/*
 * Created by Yudi Setiawan on 1/20/19 10:58 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 1/20/19 10:57 PM
 */

import 'dart:io';

import 'package:flutter/material.dart';

class MassConverterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MassConverterScreenState();
}

class MassConverterScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mass Converter",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
    );
  }
}
