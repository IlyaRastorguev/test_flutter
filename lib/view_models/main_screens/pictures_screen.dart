import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/dto/picrute_dto.dart';
import 'package:test_flutter/view_models/pictures_view.dart';

import '../error_view_model.dart';

class PicturesCardsScreen {
  final Future<ImageList> test;

  PicturesCardsScreen({this.test});

  factory PicturesCardsScreen.init(Future<ImageList> test) {
    return PicturesCardsScreen(test: test);
  }

  getScreen() {
    if (test != null) {
      return FutureBuilder<ImageList>(
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
                    children: PicturesViewModel.createModel(snap.data).widgets,
                  )),
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
