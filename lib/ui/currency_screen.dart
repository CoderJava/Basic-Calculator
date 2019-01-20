/*
 * Created by Yudi Setiawan on 1/20/19 7:27 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 1/20/19 7:24 PM
 */

import 'package:flutter/material.dart';

class CurrencyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CurrencyScreenState();
  }
}

class CurrencyScreenState extends State<CurrencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Currency Converter",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text("Coming soon"),
        ),
      ),
    );
  }
}
