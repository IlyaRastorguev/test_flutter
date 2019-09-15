import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          color: Colors.transparent,
          semanticContainer: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 300,
            padding: const EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new NetworkImage('$URL$PORT${card.url}'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop)
                ),
                gradient: new LinearGradient(
                    colors: [Colors.transparent, Colors.white],
                    begin: Alignment.topCenter,
                    end: new Alignment(0.0, 0.0),
                    ),
                borderRadius: new BorderRadius.all(const Radius.circular(20.0))),
                child: new Align(
                alignment: new Alignment(-0.8, 0.8),
                child: Text(
              card.description,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                shadows: [
            Shadow(
                blurRadius: 15.0,
                offset: Offset(0.0, 5.0),
                ),
            ],
              ),
              ),
              ),
          )));
    }

    return PicturesViewModel(widgets: pictures);
  }
}
