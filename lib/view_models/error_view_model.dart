
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_flutter/dto/error_dto.dart';

class ErrorWidgetModel {
  final ErrorDto errorDto;

  ErrorWidgetModel({this.errorDto});

  factory ErrorWidgetModel.init(ErrorDto dto) {
    return ErrorWidgetModel(
      errorDto: dto
    );
  }

  List<Widget> getErrorWidget() {
    return <Widget>[
      Image.asset('../static/icons/warning_pic.svg'),
      Text.rich(
        TextSpan(
          text: errorDto.message,
          style: TextStyle(
            color: Colors.redAccent
          )
        )
      ),
      Text.rich(
        TextSpan(
          text: '${errorDto.code}',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 32.0
          )
        )
      )
    ];
  }
}