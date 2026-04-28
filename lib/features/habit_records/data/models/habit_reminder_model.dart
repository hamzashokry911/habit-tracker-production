import 'package:habit_now_clone/features/habit_records/domain/entities/habit_reminder_entity.dart';

class HabitReminderModel {
  const HabitReminderModel({
    this.id,
    required this.habitId,
    required this.timeOfDay,
    required this.enabled,
  });

  final int? id;
  final int habitId;
  final String timeOfDay;
  final bool enabled;

  factory HabitReminderModel.fromEntity(HabitReminderEntity entity) =>
      HabitReminderModel(
        id: entity.id,
        habitId: entity.habitId,
        timeOfDay: entity.timeOfDay,
        enabled: entity.enabled,
      );

  HabitReminderEntity toEntity() => HabitReminderEntity(
        id: id,
        habitId: habitId,
        timeOfDay: timeOfDay,
        enabled: enabled,
      );

  Map<String, Object?> toMap() => <String, Object?>{
        'id': id,
        'habit_id': habitId,
        'time_of_day': timeOfDay,
        'enabled': enabled ? 1 : 0,
      };

  factory HabitReminderModel.fromMap(Map<String, Object?> map) =>
      HabitReminderModel(
        id: map['id'] as int?,
        habitId: map['habit_id'] as int,
        timeOfDay: map['time_of_day'] as String,
        enabled: (map['enabled'] as int? ?? 0) == 1,
      );
}
