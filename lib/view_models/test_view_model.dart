import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_flutter/dto/test_dto.dart';

export './test_view_model.dart';

class TestViewModel {
  final List<Widget> widgets;

  TestViewModel({this.widgets});

  factory TestViewModel.createModel(CardList cardList) {
    List<Widget> cards = [];

    for (var card in cardList.screen) {
      cards.add(Card(
        child: ListTile(
          title: Text(card.title),
          subtitle: Text(card.description)
        ),
      ));
    }

    return TestViewModel(
      widgets: cards
    );
  }
}