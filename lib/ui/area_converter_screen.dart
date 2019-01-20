/*
 * Created by Yudi Setiawan on 1/20/19 10:38 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 1/20/19 8:19 PM
 */

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
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
