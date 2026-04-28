import 'dart:convert';

import 'package:habit_now_clone/features/habit_records/domain/entities/habit_schedule_entity.dart';

class HabitScheduleModel {
  const HabitScheduleModel({
    this.id,
    required this.habitId,
    required this.type,
    this.intervalDays,
    this.daysOfWeek,
    this.daysOfMonth,
    required this.startDate,
  });

  final int? id;
  final int habitId;
  final HabitScheduleType type;
  final int? intervalDays;
  final List<int>? daysOfWeek;
  final List<int>? daysOfMonth;
  final DateTime startDate;

  factory HabitScheduleModel.fromEntity(HabitScheduleEntity entity) =>
      HabitScheduleModel(
        id: entity.id,
        habitId: entity.habitId,
        type: entity.type,
        intervalDays: entity.intervalDays,
        daysOfWeek: entity.daysOfWeek,
        daysOfMonth: entity.daysOfMonth,
        startDate: entity.startDate,
      );

  HabitScheduleEntity toEntity() => HabitScheduleEntity(
        id: id,
        habitId: habitId,
        type: type,
        intervalDays: intervalDays,
        daysOfWeek: daysOfWeek,
        daysOfMonth: daysOfMonth,
        startDate: startDate,
      );

  Map<String, Object?> toMap() => <String, Object?>{
        'id': id,
        'habit_id': habitId,
        'type': type.name,
        'interval_days': intervalDays,
        'days_of_week': daysOfWeek == null ? null : jsonEncode(daysOfWeek),
        'days_of_month': daysOfMonth == null ? null : jsonEncode(daysOfMonth),
        'start_date': startDate.toIso8601String(),
      };

  factory HabitScheduleModel.fromMap(Map<String, Object?> map) =>
      HabitScheduleModel(
        id: map['id'] as int?,
        habitId: map['habit_id'] as int,
        type: HabitScheduleType.values.byName(map['type'] as String),
        intervalDays: map['interval_days'] as int?,
        daysOfWeek: _decodeIntList(map['days_of_week'] as String?),
        daysOfMonth: _decodeIntList(map['days_of_month'] as String?),
        startDate: DateTime.parse(map['start_date'] as String),
      );

  static List<int>? _decodeIntList(String? jsonValue) {
    if (jsonValue == null) return null;
    final List<dynamic> decoded = jsonDecode(jsonValue) as List<dynamic>;
    return decoded.map((dynamic value) => value as int).toList();
  }
}
