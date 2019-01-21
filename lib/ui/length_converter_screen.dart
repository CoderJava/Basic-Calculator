/*
 * Created by Yudi Setiawan on 1/21/19 10:45 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 1/21/19 10:43 PM
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
                    child: Text("Hello"),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("World"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StaggeredGridView.count(
                crossAxisCount: 4,
                staggeredTiles: <StaggeredTile>[
                  StaggeredTile.count(3, 1),
                  StaggeredTile.count(1, 2),
                  StaggeredTile.count(3, 1),
                  StaggeredTile.count(3, 1),
                  StaggeredTile.count(1, 2),
                  StaggeredTile.count(2, 1),
                  StaggeredTile.count(1, 1),
                ],
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey[200],
                        width: 0.5,
                      ),
                    ),
                    child: Center(
                      child: Text("789"),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey[200],
                        width: 0.5,
                      ),
                    ),
                    child: Center(
                      child: Text("AC"),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey[200],
                        width: 0.5,
                      ),
                    ),
                    child: Center(
                      child: Text("456"),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey[200],
                        width: 0.5,
                      ),
                    ),
                    child: Center(
                      child: Text("123"),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey[200],
                        width: 0.5,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey[200],
                          width: 0.5,
                        ),
                      ),
                      child: Center(
                        child: Text("X"),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey[200],
                        width: 0.5,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey[200],
                          width: 0.5,
                        ),
                      ),
                      child: Center(
                        child: Text("0"),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey[200],
                        width: 0.5,
                      ),
                    ),
                    child: Center(
                      child: Text("."),
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
}
