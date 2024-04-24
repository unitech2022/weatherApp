import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/features/forecast/data/models/forcast_model.dart';
import 'package:weather_app/features/home/data/models/location_model.dart';
import 'package:weather_app/features/home/data/models/weather_model.dart';
import 'package:weather_app/features/home/data/models/weather_response.dart';

part 'forcast_response.g.dart';

@JsonSerializable()
class ForcastResponse extends WeatherResponse {
  final ForcastData forecast;

  ForcastResponse(
      {required this.forecast,
      required super.location,
      required super.current});

  factory ForcastResponse.fromJson(Map<String, dynamic> json) =>
      _$ForcastResponseFromJson(json);


}

@JsonSerializable()
class ForcastData {
  final List<ForcastModel> forecastday;

  ForcastData({required this.forecastday});

  factory ForcastData.fromJson(Map<String, dynamic> json) =>
      _$ForcastDataFromJson(json);

 
}
