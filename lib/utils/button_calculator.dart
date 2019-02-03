/*
 * Created by Yudi Setiawan on 2/3/19 10:17 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 2/3/19 10:04 PM
 */

import 'package:basic_calculator_app/values/color_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonCalculator extends StatelessWidget {
  final Color _buttonColorWhite = Colors.white;
  final Color _buttonHightlightColor = Colors.grey[800];
  final Color _textColorGrey = Colors.grey;

  final double _buttonFontSizeCalculator = 24.0;

  final String typeButton;
  final VoidCallback actionOnPressed;
  final VoidNavigate actionOnPressedWithParameter;
  final String valueActionOnPressedWithParameter;
  final String label;

  ButtonCalculator(this.typeButton,
      {this.actionOnPressed,
      this.actionOnPressedWithParameter,
      this.valueActionOnPressedWithParameter,
      this.label});

  @override
  Widget build(BuildContext context) {
    if (typeButton == "general") {
      return RaisedButton(
        color: _buttonColorWhite,
        highlightColor: _buttonHightlightColor,
        child: Text(
          label,
          style: TextStyle(
            color: _textColorGrey,
            fontSize: _buttonFontSizeCalculator,
          ),
        ),
        onPressed: () {
          actionOnPressedWithParameter(valueActionOnPressedWithParameter);
        },
      );
    } else if (typeButton == "clear") {
      return RaisedButton(
        color: _buttonColorWhite,
        highlightColor: _buttonHightlightColor,
        child: Text(
          "C",
          style: TextStyle(
            color: ColorAssets.primarySwatchColor,
            fontSize: _buttonFontSizeCalculator,
          ),
        ),
        onPressed: actionOnPressed,
      );
    } else if (typeButton == "backspace") {
      return RaisedButton(
        color: _buttonColorWhite,
        highlightColor: _buttonHightlightColor,
        child: Icon(
          Icons.backspace,
          color: _textColorGrey,
        ),
        onPressed: actionOnPressed,
      );
    }
    return null;
  }
}

typedef VoidNavigate = void Function(String route);
