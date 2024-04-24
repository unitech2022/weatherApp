// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorMessageResponse _$ErrorMessageResponseFromJson(
        Map<String, dynamic> json) =>
    ErrorMessageResponse(
      error: ErrorMessageData.fromJson(json['error'] as Map<String, dynamic>),
    );



ErrorMessageData _$ErrorMessageDataFromJson(Map<String, dynamic> json) =>
    ErrorMessageData(
      code: json['code'] as int,
      message: json['message'] as String,
    );


