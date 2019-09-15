import 'dart:convert';

import 'package:test_flutter/dto/app_theme.dart';
import 'package:http/http.dart';
import 'api_params.dart';

export './theme_params.dart';

class AppThemeRequest {
  static final String url = '$URL$PORT/test/flutter/theme';
  static final String error = 'Can`t!!! Server is no response! Code of error: ';
  final Future<AppThemeDto> response;

  AppThemeRequest.get() :response = _makeRequest();


  static Future<AppThemeDto> _makeRequest() async {
    final resp = await get(url);
    if (resp.statusCode == 200) {
      return AppThemeDto.fromJson(json.decode(resp.body));
    }

    return AppThemeDto.withError('$error${resp.statusCode}', resp.statusCode);
  }
}