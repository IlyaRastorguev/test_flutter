import 'package:flutter/material.dart';
import 'package:test_flutter/networkUtils/api/image_views.dart';
import 'package:test_flutter/networkUtils/api/test.dart';
import 'package:test_flutter/view_models/main_screens/pictures_screen.dart';
import 'package:test_flutter/view_models/main_screens/start_screen.dart';
import 'package:test_flutter/view_models/main_screens/text_cards_screen.dart';

import 'dto/picrute_dto.dart';
import 'dto/test_dto.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.red, backgroundColor: Colors.amberAccent),
      home: MyHomePage(title: 'Flutter Home Page asdgjasgdajsd asgdhjasgdj a'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  Future<CardList> textCards;
  Future<ImageList> imageCards;

  void getUser(int selectIndex) {
    if (selectIndex == 1) {
      setState(() {
        textCards = TestRequest.get().response;
        index = selectIndex;
      });
    } else if (selectIndex == 2)
      setState(() {
        imageCards = PicturesRequest.get().response;
        index = selectIndex;
      });
    else
      setState(() {
        textCards = null;
        index = selectIndex;
      });
  }

  selectScreen()
  {
    switch (index) {
      case 1:
        return TextCardsScreen.init(textCards).getScreen();
      case 2:
        return PicturesCardsScreen.init(imageCards).getScreen();
      case 0:
      default:
        return StartScreen.init().getScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: selectScreen()
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility), title: Text('StartScreen')),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility), title: Text('Pictures')),
          BottomNavigationBarItem(
              icon: Icon(Icons.pages), title: Text('TextCards'))
        ],
        currentIndex: index,
        onTap: getUser,
      ),
    );
  }
}
