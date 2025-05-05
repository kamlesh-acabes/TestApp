import 'package:flutter/material.dart';

import 'listview_screen.dart';

extension NumberParsing on String {

  int toInt() {
    RegExp regex = RegExp("[^0-9]");
    var numberString =  replaceAll(regex, "");
    return int.tryParse(numberString) ?? 0;
  }
}