enum HabitScheduleType { daily, weekly, monthly, interval }

class HabitScheduleEntity {
  const HabitScheduleEntity({
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
}
