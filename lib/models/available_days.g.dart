// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_days.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableDayModel _$AvailableDayModelFromJson(Map<String, dynamic> json) =>
    AvailableDayModel(
      day: ValueWithIdModel.fromJson(json['day'] as Map<String, dynamic>),
      hours: (json['hours'] as List<dynamic>)
          .map((e) => DayHourRangeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AvailableDayModelToJson(AvailableDayModel instance) =>
    <String, dynamic>{
      'day': instance.day.toJson(),
      'hours': instance.hours.map((e) => e.toJson()).toList(),
    };

DayHourRangeModel _$DayHourRangeModelFromJson(Map<String, dynamic> json) =>
    DayHourRangeModel(
      json['start_minute'] as int? ?? 0,
      json['end_minute'] as int? ?? 0,
      json['start_hour'] as int? ?? 0,
      json['end_hour'] as int? ?? 0,
    );

Map<String, dynamic> _$DayHourRangeModelToJson(DayHourRangeModel instance) =>
    <String, dynamic>{
      'start_hour': instance.startHour,
      'start_minute': instance.startMinute,
      'end_hour': instance.endHour,
      'end_minute': instance.endMinute,
    };
