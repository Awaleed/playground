import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'value_with_id_model.dart';

part 'available_days.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class AvailableDayModel {
  AvailableDayModel({
    required this.day,
    required this.hours,
  });

  final ValueWithIdModel day;
  final List<DayHourRangeModel> hours;

  factory AvailableDayModel.fromJson(Map<String, dynamic> json) {
    json['day']['id'] = int.parse(json['day']['id'].toString());
    return _$AvailableDayModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$AvailableDayModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DayHourRangeModel {
  DayHourRangeModel([
    this.startMinute = 0,
    this.endMinute = 0,
    this.startHour = 0,
    this.endHour = 0,
  ]);

  int startHour;
  int startMinute;

  int endHour;
  int endMinute;

  @JsonKey(ignore: true)
  TimeOfDayRange get range => TimeOfDayRange(
        start: TimeOfDay(hour: startHour, minute: startMinute),
        end: TimeOfDay(hour: endHour, minute: endMinute),
      );

  set range(TimeOfDayRange value) {
    startHour = value.start.hour;
    startMinute = value.start.minute;
    endHour = value.end.hour;
    endMinute = value.end.minute;
  }

  factory DayHourRangeModel.fromJson(Map<String, dynamic> json) {
    json['start_minute'] = int.parse(json['start_minute'].toString());
    json['end_minute'] = int.parse(json['end_minute'].toString());
    json['start_hour'] = int.parse(json['start_hour'].toString());
    json['end_hour'] = int.parse(json['end_hour'].toString());

    return _$DayHourRangeModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$DayHourRangeModelToJson(this);
}

class TimeOfDayRange {
  /// Creates a date range for the given start and end [DateTime].
  TimeOfDayRange({
    required this.start,
    required this.end,
  }) /* : assert(start != null),
       assert(end != null),
       assert(!start.isAfter(end)) */
  ;

  /// The start of the range of dates.
  final TimeOfDay start;

  /// The end of the range of dates.
  final TimeOfDay end;

  /// Returns a [Duration] of the time between [start] and [end].
  ///
  /// See [DateTime.difference] for more details.
  // Duration get duration => end.difference(start);

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is TimeOfDayRange && other.start == start && other.end == end;
  }

  @override
  int get hashCode => hashValues(start, end);

  @override
  String toString() => '$start - $end';
}

extension Compare on TimeOfDay {
  int compareTo(TimeOfDay other) {
    final t = hour + minute / 60.0;
    final o = other.hour + other.minute / 60.0;
    return t.compareTo(o);
  }
}
