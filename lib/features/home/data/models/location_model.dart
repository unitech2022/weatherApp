import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.g.dart';
@JsonSerializable()
class LocationModel{

  final String name;
  final String region;
  final String country;

  LocationModel({required this.name, required this.region, required this.country});

/// * from json
  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);


}