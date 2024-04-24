import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  @JsonKey(name: 'temp_c')
  final double tempC;
  @JsonKey(name: 'temp_f')
  final double tempF;
  final double humidity;
  @JsonKey(name: 'wind_mph')
  final double windMph;
  @JsonKey(name: 'wind_kph')
  final double windKph;
  final double cloud;
  final ConditionModel condition;

  WeatherModel(
      {required this.tempC,
      required this.tempF,
      required this.humidity,
      required this.windMph,
      required this.windKph,
      required this.cloud,
      required this.condition});

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class ConditionModel {
  final String text;
  final String icon;

  ConditionModel({required this.text, required this.icon});

  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelFromJson(json);


}
