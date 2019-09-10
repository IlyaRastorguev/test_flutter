export './test_dto.dart';

import 'package:test_flutter/dto/error_dto.dart';

class Test {
  final String title;
  final String description;

  Test({this.title, this.description});


  factory Test.fromJson(Map<String, dynamic> data) {
    return Test(
        title: data['title'],
        description: data['description']
    );
  }
}

class CardList {
  final List<Test> screen;
  final ErrorDto error;

  CardList({this.screen, this.error});

  factory CardList.fromJson(Map<String, dynamic> body) {
    if (body == null) return CardList(
      screen: []
    );

    List<Test> cards = [];

    for (var card in body['data']) {
      cards.add(Test.fromJson(card));
    }

    return CardList(
      screen: cards
    );
  }

  factory CardList.withError(String message, int errorCode) {
    return CardList(
      error: ErrorDto.init(message, errorCode)
    );
  }
}