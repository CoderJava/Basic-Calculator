/*
 * Created by Yudi Setiawan on 1/20/19 10:38 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 1/20/19 10:35 PM
 */

import 'dart:io';

import 'package:flutter/material.dart';

class VolumeConverterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VolumeConverterScreenState();
}

class VolumeConverterScreenState extends State<VolumeConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Volume Converter",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Text("Coming soon"),
      ),
    );
  }
}
