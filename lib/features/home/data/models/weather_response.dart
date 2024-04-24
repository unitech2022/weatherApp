import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/features/home/data/models/location_model.dart';

import 'weather_model.dart';

part 'weather_response.g.dart';
@JsonSerializable()
class WeatherResponse {
  final LocationModel location;
  final WeatherModel current;

  WeatherResponse({required this.location, required this.current});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

 
}
