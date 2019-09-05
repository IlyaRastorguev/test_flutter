import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_flutter/networkUtils/api/test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        backgroundColor: Colors.amberAccent
      ),
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
  Future<http.Response> test;

  void getUser(int selectIndex) {
    if (selectIndex == 1) {
      setState(() {
        test = TestRequest.get().response;
        index = selectIndex;
      });
    } else setState(() {
      test = null;
      index = selectIndex;
    });
  }

  showData () {
    if (test != null) {
      return FutureBuilder<http.Response>(
        future: test,
        builder: (context, snap) {
          return ListView(
            shrinkWrap: true,
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text('Almost'),
                  subtitle: Text('get data'),
                ),
              )
            ],
          );
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            showData(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.accessibility),
              title: Text('TEsdgcshdc')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pages),
              title: Text('GHJAFGShcsdc')
            )
          ],
          currentIndex: index,
          onTap: getUser,
      ),
    );
  }
}