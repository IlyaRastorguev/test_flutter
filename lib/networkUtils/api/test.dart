import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:test_flutter/dto/test_dto.dart';

export './test.dart';

class TestRequest {
  static final int port = 3000;
  static final String url = 'http://10.9.63.95:$port/test/flutter';
  final Future<Response> response;

  TestRequest.get() :response = _makeRequest();


  static Future<Response> _makeRequest() async {
    return get(url);
  }
}