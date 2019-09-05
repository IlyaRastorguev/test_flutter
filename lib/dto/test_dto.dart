export './test_dto.dart';

class Test {
  final String title;
  final String description;

  Test(this.title, this.description);

  Test.fromJson(Map<String, dynamic> data) 
      : title = data['title'],
        description = data['description'];
}