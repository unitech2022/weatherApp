// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forcast_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForcastResponse _$ForcastResponseFromJson(Map<String, dynamic> json) =>
    ForcastResponse(
      forecast: ForcastData.fromJson(json['forecast'] as Map<String, dynamic>),
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      current: WeatherModel.fromJson(json['current'] as Map<String, dynamic>),
    );



ForcastData _$ForcastDataFromJson(Map<String, dynamic> json) => ForcastData(
      forecastday: (json['forecastday'] as List<dynamic>)
          .map((e) => ForcastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );


