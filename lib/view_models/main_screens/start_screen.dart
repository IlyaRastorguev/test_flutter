import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartScreen {

  StartScreen();

  factory StartScreen.init() {
    return StartScreen();
  }

  getScreen () {
    return Center (
      child: Container(
      child: Text('Hello this is flutter'),
    ),
    );
  }

}