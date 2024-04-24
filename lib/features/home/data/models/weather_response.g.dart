// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      current: WeatherModel.fromJson(json['current'] as Map<String, dynamic>),
    );

