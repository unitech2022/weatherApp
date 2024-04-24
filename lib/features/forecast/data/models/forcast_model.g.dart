// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forcast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForcastModel _$ForcastModelFromJson(Map<String, dynamic> json) => ForcastModel(
      date: json['date'] as String,
      day: DayModel.fromJson(json['day'] as Map<String, dynamic>),
      dateEpoch: json['date_epoch'] as int,
    );



DayModel _$DayModelFromJson(Map<String, dynamic> json) => DayModel(
      maxtempC: (json['maxtemp_c'] as num).toDouble(),
      maxtempF: (json['maxtemp_f'] as num).toDouble(),
      mintempC: (json['mintemp_c'] as num).toDouble(),
      mintempF: (json['mintemp_f'] as num).toDouble(),
      condition:
          ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
      avghumidity: (json['avghumidity'] as num).toDouble(),
    );

Map<String, dynamic> _$DayModelToJson(DayModel instance) => <String, dynamic>{
      'maxtemp_c': instance.maxtempC,
      'maxtemp_f': instance.maxtempF,
      'mintemp_c': instance.mintempC,
      'mintemp_f': instance.mintempF,
      'avghumidity': instance.avghumidity,
      'condition': instance.condition,
    };
