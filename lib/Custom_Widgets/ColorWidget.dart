import 'package:flutter/material.dart';

class ColorWidget {
  String colorName;
  Color iconColor;

  ColorWidget(String colorName, Color iconColor) {
    this.colorName = colorName;
    this.iconColor = iconColor;
  }
}

void main() {
  ColorWidget pinkIcon = ColorWidget('pink', Colors.pink);
  print(pinkIcon);
}
