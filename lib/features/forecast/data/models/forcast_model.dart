import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/features/home/data/models/weather_model.dart';

part 'forcast_model.g.dart';

@JsonSerializable()
class ForcastModel {
  final String date;
  @JsonKey(name: 'date_epoch')
  final int dateEpoch;

  final DayModel day;

  ForcastModel(
      {required this.date, required this.day, required this.dateEpoch});

  factory ForcastModel.fromJson(Map<String, dynamic> json) =>
      _$ForcastModelFromJson(json);

}

@JsonSerializable()
class DayModel {
  @JsonKey(name: 'maxtemp_c')
  final double maxtempC;
  @JsonKey(name: 'maxtemp_f')
  final double maxtempF;
  @JsonKey(name: 'mintemp_c')
  final double mintempC;
  @JsonKey(name: 'mintemp_f')
  final double mintempF;
  final double avghumidity;
  final ConditionModel condition;

  DayModel(
      {required this.maxtempC,
      required this.maxtempF,
      required this.mintempC,
      required this.mintempF,
      required this.condition,
      required this.avghumidity});

  factory DayModel.fromJson(Map<String, dynamic> json) =>
      _$DayModelFromJson(json);

  Map<String, dynamic> toJson() => _$DayModelToJson(this);
}
