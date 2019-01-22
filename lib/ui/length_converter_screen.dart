/*
 * Created by Yudi Setiawan on 1/22/19 9:47 AM
 * Copyright (c) 2019. All right reserved.
 * Last modified 1/22/19 9:45 AM
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
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 2),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 2),
                  StaggeredTile.count(2, 1),
                  StaggeredTile.count(1, 1),
                ],
                children: <Widget>[
                  RaisedButton(
                    color: Colors.white,
                    highlightColor: Colors.grey[800],
                    child: Text(
                      "7",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24.0,
                      ),
                    ),
                    onPressed: () {
                      // TODO: do something in here
                    },
                  ),
                  RaisedButton(
                    color: Colors.white,
                    highlightColor: Colors.grey[800],
                    child: Text(
                      "8",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24.0,
                      ),
                    ),
                    onPressed: () {
                      // TODO: do something in here
                    },
                  ),
                  RaisedButton(
                    color: Colors.white,
                    highlightColor: Colors.grey[800],
                    child: Text(
                      "9",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24.0,
                      ),
                    ),
                    onPressed: () {
                      // TODO: do something in here
                    },
                  ),
                  RaisedButton(
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
                  ),
                  RaisedButton(
                    color: Colors.white,
                    highlightColor: Colors.grey[800],
                    child: Text(
                      "4",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24.0,
                      ),
                    ),
                    onPressed: () {
                      // TODO: do something in here
                    },
                  ),
                  RaisedButton(
                    color: Colors.white,
                    highlightColor: Colors.grey[800],
                    child: Text(
                      "5",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24.0,
                      ),
                    ),
                    onPressed: () {
                      // TODO: do something in here
                    },
                  ),
                  RaisedButton(
                    color: Colors.white,
                    highlightColor: Colors.grey[800],
                    child: Text(
                      "6",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24.0,
                      ),
                    ),
                    onPressed: () {
                      // TODO: do something in here  
                    },
                  ),
                  RaisedButton(
                    color: Colors.white,
                    highlightColor: Colors.grey[800],
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24.0,
                      ),
                    ),
                    onPressed: () {
                      // TODO: do something in here  
                    },
                  ),
                  RaisedButton(
                    color: Colors.white,
                    highlightColor: Colors.grey[800],
                    child: Text(
                      "2",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24.0,
                      ),
                    ),
                    onPressed: () {
                      // TODO: do something in here  
                    },
                  ),
                  RaisedButton(
                    color: Colors.white,
                    highlightColor: Colors.grey[800],
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24.0,
                      ),
                    ),
                    onPressed: () {
                      // TODO: do something in here
                    },
                  ),
                  RaisedButton(
                    color: Colors.white,
                    highlightColor: Colors.grey[800],
                    child: Icon(
                      Icons.backspace,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // TODO: do something in here
                    },
                  ),
                  RaisedButton(
                    color: Colors.white,
                    highlightColor: Colors.grey[800],
                    child: Text(
                      "0",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24.0,
                      ),
                    ),
                    onPressed: () {
                      // TODO: do something in here
                    },
                  ),
                  RaisedButton(
                    color: Colors.white,
                    highlightColor: Colors.grey[800],
                    child: Text(
                      ".",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24.0,
                      ),
                    ),
                    onPressed: () {
                      // TODO: do something in here
                    },
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
