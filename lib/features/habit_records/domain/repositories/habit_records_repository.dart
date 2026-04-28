import 'package:habit_now_clone/features/habit_records/domain/entities/habit_category_entity.dart';
import 'package:habit_now_clone/features/habit_records/domain/entities/habit_completion_entity.dart';
import 'package:habit_now_clone/features/habit_records/domain/entities/habit_entity.dart';
import 'package:habit_now_clone/features/habit_records/domain/entities/habit_reminder_entity.dart';
import 'package:habit_now_clone/features/habit_records/domain/entities/habit_schedule_entity.dart';

abstract class HabitRecordsRepository {
  Future<int> createHabit(HabitEntity habit);
  Future<List<HabitEntity>> getHabits();
  Future<void> updateHabit(HabitEntity habit);
  Future<void> deleteHabit(int id);

  Future<int> createCategory(HabitCategoryEntity category);
  Future<List<HabitCategoryEntity>> getCategories();
  Future<void> updateCategory(HabitCategoryEntity category);
  Future<void> deleteCategory(int id);

  Future<int> createSchedule(HabitScheduleEntity schedule);
  Future<List<HabitScheduleEntity>> getSchedulesByHabitId(int habitId);
  Future<void> updateSchedule(HabitScheduleEntity schedule);
  Future<void> deleteSchedule(int id);

  Future<int> createCompletion(HabitCompletionEntity completion);
  Future<List<HabitCompletionEntity>> getCompletionsByHabitId(int habitId);
  Future<void> updateCompletion(HabitCompletionEntity completion);
  Future<void> deleteCompletion(int id);

  Future<int> createReminder(HabitReminderEntity reminder);
  Future<List<HabitReminderEntity>> getRemindersByHabitId(int habitId);
  Future<void> updateReminder(HabitReminderEntity reminder);
  Future<void> deleteReminder(int id);
}
