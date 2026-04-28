import 'package:habit_now_clone/features/habit_records/domain/entities/habit_completion_entity.dart';

class HabitCompletionModel {
  const HabitCompletionModel({
    this.id,
    required this.habitId,
    required this.completionDate,
    required this.status,
    this.note,
  });

  final int? id;
  final int habitId;
  final DateTime completionDate;
  final HabitCompletionStatus status;
  final String? note;

  factory HabitCompletionModel.fromEntity(HabitCompletionEntity entity) =>
      HabitCompletionModel(
        id: entity.id,
        habitId: entity.habitId,
        completionDate: entity.completionDate,
        status: entity.status,
        note: entity.note,
      );

  HabitCompletionEntity toEntity() => HabitCompletionEntity(
        id: id,
        habitId: habitId,
        completionDate: completionDate,
        status: status,
        note: note,
      );

  Map<String, Object?> toMap() => <String, Object?>{
        'id': id,
        'habit_id': habitId,
        'completion_date': completionDate.toIso8601String(),
        'status': status.name,
        'note': note,
      };

  factory HabitCompletionModel.fromMap(Map<String, Object?> map) =>
      HabitCompletionModel(
        id: map['id'] as int?,
        habitId: map['habit_id'] as int,
        completionDate: DateTime.parse(map['completion_date'] as String),
        status: HabitCompletionStatus.values.byName(map['status'] as String),
        note: map['note'] as String?,
      );
}
