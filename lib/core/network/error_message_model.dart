import 'package:json_annotation/json_annotation.dart';
part 'error_message_model.g.dart';

@JsonSerializable()
class ErrorMessageResponse{
  final ErrorMessageData error;

  const ErrorMessageResponse({required this.error});

  factory ErrorMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorMessageResponseFromJson(json);
}

@JsonSerializable()
class ErrorMessageData {
  final int code;
  final String message;

  const ErrorMessageData({required this.code, required this.message});

  factory ErrorMessageData.fromJson(Map<String, dynamic> json) =>
      _$ErrorMessageDataFromJson(json);


}
