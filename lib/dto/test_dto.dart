export './test_dto.dart';

import 'dart:math';

class Test {
  final String title;
  final String description;
  final error;

  Test({this.title, this.description, this.error});


  factory Test.fromJson(Map<String, dynamic> data) {
    return Test(
        title: data['title'],
        description: data['description']
    );
  }

  factory Test.error(String err) {
    return Test(error: err);
  }
}