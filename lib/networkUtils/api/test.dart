import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_flutter/dto/test_dto.dart';
import 'package:test_flutter/networkUtils/api/api_params.dart';

export './test.dart';

class TestRequest {
  static final String url = '$URL$PORT/test/flutter/start';
  static final String error = 'Can`t!!! Server is no response! Code of error: ';
  final Future<CardList> response;

  TestRequest.get() :response = _makeRequest();


  static Future<CardList> _makeRequest() async {
    final resp = await get(url);
    if (resp.statusCode == 200) {
      return CardList.fromJson(json.decode(resp.body));
    }

    return CardList.withError('$error${resp.statusCode}', resp.statusCode);
  }
}