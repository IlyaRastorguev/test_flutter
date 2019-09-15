
export './app_theme.dart';

import 'package:test_flutter/dto/error_dto.dart';

class AppThemeDto {
  final int r;
  final int g;
  final int b;
  final String backGroundUrl;
  final ErrorDto error;

  AppThemeDto({this.r, this.g, this.b, this.backGroundUrl, this.error});

  factory AppThemeDto.fromJson(Map<String, dynamic> body) {
    return AppThemeDto(
      r: body['data']['r'],
      g: body['data']['g'],
      b: body['data']['b'],
      backGroundUrl: body['data']['url']
    );
  }

  factory AppThemeDto.fromRGB(int r, int g, int b) {
    return AppThemeDto(
      r: r,
      g: g,
      b: b
    );
  }

  factory AppThemeDto.withError(String message, int errorCode) {
    return AppThemeDto(
        error: ErrorDto.init(message, errorCode)
    );
  }
}