import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_flutter/networkUtils/api/test.dart';
import 'package:test_flutter/view_models/error_view_model.dart';
import 'package:test_flutter/view_models/test_view_model.dart';

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
  Future<CardList> test;

  void getUser(int selectIndex) {
    if (selectIndex == 1) {
      setState(() {
        test = TestRequest.get().response;
        index = selectIndex;
      });
    } else
      setState(() {
        test = null;
        index = selectIndex;
      });
  }

  showData() {
    if (test != null) {
      return FutureBuilder<CardList>(
        future: test,
        builder: (context, snap) {
          if (snap.hasData) {
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ListView(
                    shrinkWrap: true,
                    children: TestViewModel.createModel(snap.data).widgets,
                  )
                ),
              )
            );
          } else if (snap.hasError) {
            return ListView(
              shrinkWrap: false,
              children: ErrorWidgetModel.init(snap.data.error).getErrorWidget(),
            );
          }

          return Text('');
        },
      );
    }
    return Text('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: showData(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility), title: Text('TEsdgcshdc')),
          BottomNavigationBarItem(
              icon: Icon(Icons.pages), title: Text('GHJAFGShcsdc'))
        ],
        currentIndex: index,
        onTap: getUser,
      ),
    );
  }
}
