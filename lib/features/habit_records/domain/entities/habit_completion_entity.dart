enum HabitCompletionStatus { completed, skipped, failed }

class HabitCompletionEntity {
  const HabitCompletionEntity({
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
}
