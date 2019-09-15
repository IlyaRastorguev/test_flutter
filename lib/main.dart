import 'package:flutter/material.dart';
import 'package:test_flutter/dto/app_theme.dart';
import 'package:test_flutter/networkUtils/api/image_views.dart';
import 'package:test_flutter/networkUtils/api/test.dart';
import 'package:test_flutter/networkUtils/api/theme_params.dart';
import 'package:test_flutter/view_models/main_screens/pictures_screen.dart';
import 'package:test_flutter/view_models/main_screens/start_screen.dart';
import 'package:test_flutter/view_models/main_screens/text_cards_screen.dart';

import 'dto/picrute_dto.dart';
import 'dto/test_dto.dart';
import 'networkUtils/api/api_params.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AppThemeDto>(
      future: AppThemeRequest.get().response,
      builder: (context, snap) {
        if (snap.hasData && !snap.hasError) {
          return MaterialApp(
            title: 'Flutter Demo',
            home: MyHomePage(
              title: 'Page',
              backgroundUrl: snap.data.backGroundUrl,
              colors: AppThemeDto.fromRGB(snap.data.r, snap.data.g, snap.data.b)
            ),
            theme: ThemeData(
                accentColor: Color.fromARGB(30, snap.data.r, snap.data.g, snap.data.b),
                primaryColor:
                    Color.fromARGB(0xFF, snap.data.r, snap.data.g, snap.data.b),
                bottomAppBarTheme: BottomAppBarTheme(
                    color: Color.fromARGB(
                        250, snap.data.r, snap.data.g, snap.data.b))),
          );
        }

        return MaterialApp(
          title: "Error bitch",
          home: Text(""),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.backgroundUrl, this.colors}) : super(key: key);

  final String title;
  final String backgroundUrl;
  final AppThemeDto colors;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  Future<CardList> textCards;
  Future<ImageList> imageCards;
  Future<AppThemeDto> theme;

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

  getTheme() {
    if (theme == null) {
      setState(() {
        theme = AppThemeRequest.get().response;
      });
    }
  }

  getWidgets() {
    return Column(
      children: <Widget>[Expanded(child: selectScreen())],
    );
  }

  selectScreen() {
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
    getTheme();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   textTheme: TextTheme(
      //     title: TextStyle(
      //       color: Color.fromARGB(0XFF, widget.colors.r, widget.colors.g, widget.colors.b),
      //       fontSize: 24
      //     )
      //   ),
      //   title: Text(widget.title),
      // ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: new NetworkImage('$URL$PORT${widget.backgroundUrl}'),
                fit: BoxFit.cover)),
        child: getWidgets(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(0XFF, widget.colors.r, widget.colors.g, widget.colors.b),
        unselectedItemColor: Color.fromARGB(70, widget.colors.r, widget.colors.g, widget.colors.b),
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
