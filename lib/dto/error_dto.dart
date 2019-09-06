export './error_dto.dart';

class ErrorDto {
  final String message;
  final int code;

  ErrorDto({this.code, this.message});

  factory ErrorDto.init(String mess, int code) {
    return ErrorDto(
      message: mess,
      code: code
    );
  }
}