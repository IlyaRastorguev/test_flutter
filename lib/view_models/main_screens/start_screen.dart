import 'package:flutter/cupertino.dart';

class StartScreen {

  StartScreen();

  factory StartScreen.init() {
    return StartScreen();
  }

  getScreen () {
    return Text('Hello this is flutter');
  }

}