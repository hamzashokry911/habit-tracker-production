class HabitReminderEntity {
  const HabitReminderEntity({
    this.id,
    required this.habitId,
    required this.timeOfDay,
    required this.enabled,
  });

  final int? id;
  final int habitId;
  final String timeOfDay;
  final bool enabled;
}
