/*
 * Created by Yudi Setiawan on 1/20/19 10:42 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 1/20/19 10:39 PM
 */

import 'dart:io';

import 'package:flutter/material.dart';

class AreaConverterScreen extends StatefulWidget {
  @override
  State createState() {
    return AreaConverterScreenState();
  }
}

class AreaConverterScreenState extends State<AreaConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Area Converter",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
