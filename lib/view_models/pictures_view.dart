import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart' as prefix0;
import 'package:test_flutter/dto/picrute_dto.dart';
import 'package:test_flutter/networkUtils/api/api_params.dart';

export './test_view_model.dart';

class PicturesViewModel {
  final List<Widget> widgets;

  PicturesViewModel({this.widgets});

  factory PicturesViewModel.createModel(ImageList cardList) {
    List<Widget> pictures = [];

    for (var card in cardList.screen) {
      pictures.add(Card(
        child: prefix0.Image(
          image: NetworkImage('$URL$PORT${card.url}'),
          semanticLabel: card.description
        ),
      ));
    }

    return PicturesViewModel(
        widgets: pictures
    );
  }
}