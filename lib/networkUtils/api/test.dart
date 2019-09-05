import 'dart:convert';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:test_flutter/dto/test_dto.dart';

export './test.dart';

class TestRequest {
  static final int port = 3000;
  static final String url = 'http://10.9.63.95:$port/test/flutter/start';
  static final String error = 'Can`t!!! Server is no response! Code of error: ';
  final Future<Test> response;

  TestRequest.get() :response = _makeRequest();


  static Future<Test> _makeRequest() async {
    final resp = await get(url);
    if (resp.statusCode == 200) {
      return Test.fromJson(json.decode(resp.body));
    }

    return Test.error('$error${resp.statusCode}');
  }
}