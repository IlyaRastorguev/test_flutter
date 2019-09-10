export './test_dto.dart';

import 'package:test_flutter/dto/error_dto.dart';

class Image {
  final String title;
  final String url;
  final String description;

  Image({this.title, this.url, this.description});


  factory Image.fromJson(Map<String, dynamic> data) {
    return Image(
        title: data['title'],
        url: data['url'],
        description: data['description']
    );
  }
}

class ImageList {
  final List<Image> screen;
  final ErrorDto error;

  ImageList({this.screen, this.error});

  factory ImageList.fromJson(Map<String, dynamic> body) {
    if (body == null) return ImageList(
        screen: []
    );

    List<Image> images = [];

    for (var card in body['data']) {
      images.add(Image.fromJson(card));
    }

    return ImageList(
        screen: images
    );
  }

  factory ImageList.withError(String message, int errorCode) {
    return ImageList(
        error: ErrorDto.init(message, errorCode)
    );
  }
}