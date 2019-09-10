import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_flutter/dto/picrute_dto.dart';
import 'package:test_flutter/networkUtils/api/api_params.dart';

export './test.dart';

class PicturesRequest {
  static final String url = '$URL$PORT/test/flutter/images';
  static final String error = 'Can`t!!! Server is no response! Code of error: ';
  final Future<ImageList> response;

  PicturesRequest.get() :response = _makeRequest();


  static Future<ImageList> _makeRequest() async {
    final resp = await get(url);
    if (resp.statusCode == 200) {
      return ImageList.fromJson(json.decode(resp.body));
    }

    return ImageList.withError('$error${resp.statusCode}', resp.statusCode);
  }
}