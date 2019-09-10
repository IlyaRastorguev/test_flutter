

import 'package:flutter/cupertino.dart';
import 'package:test_flutter/dto/test_dto.dart';

import '../error_view_model.dart';
import '../test_view_model.dart';

class TextCardsScreen {

  final Future<CardList> test;

  TextCardsScreen({this.test});

  factory TextCardsScreen.init(Future<CardList> test) {
    return TextCardsScreen(
      test: test
    );
  }

  getScreen () {
  if (test != null) {
    return FutureBuilder<CardList>(
      future: test,
      builder: (context, snap) {
        if (snap.hasData) {
          return Container(
            margin: const EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.topCenter,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: ScrollController(),
                  children: TestViewModel.createModel(snap.data).widgets,
                )
            ),
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

}