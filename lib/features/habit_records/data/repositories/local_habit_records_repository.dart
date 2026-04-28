import 'package:habit_now_clone/features/habit_records/data/datasources/habit_records_local_data_source.dart';
import 'package:habit_now_clone/features/habit_records/data/models/habit_category_model.dart';
import 'package:habit_now_clone/features/habit_records/data/models/habit_completion_model.dart';
import 'package:habit_now_clone/features/habit_records/data/models/habit_model.dart';
import 'package:habit_now_clone/features/habit_records/data/models/habit_reminder_model.dart';
import 'package:habit_now_clone/features/habit_records/data/models/habit_schedule_model.dart';
import 'package:habit_now_clone/features/habit_records/domain/entities/habit_category_entity.dart';
import 'package:habit_now_clone/features/habit_records/domain/entities/habit_completion_entity.dart';
import 'package:habit_now_clone/features/habit_records/domain/entities/habit_entity.dart';
import 'package:habit_now_clone/features/habit_records/domain/entities/habit_reminder_entity.dart';
import 'package:habit_now_clone/features/habit_records/domain/entities/habit_schedule_entity.dart';
import 'package:habit_now_clone/features/habit_records/domain/repositories/habit_records_repository.dart';

class LocalHabitRecordsRepository implements HabitRecordsRepository {
  LocalHabitRecordsRepository(this._localDataSource);

  final HabitRecordsLocalDataSource _localDataSource;

  @override
  Future<int> createHabit(HabitEntity habit) {
    final HabitModel model = HabitModel.fromEntity(habit);
    return _localDataSource.insert('habits', model.toMap()..remove('id'));
  }

  @override
  Future<List<HabitEntity>> getHabits() async {
    final List<Map<String, Object?>> rows = await _localDataSource.queryAll(
      'habits',
      orderBy: 'id DESC',
    );
    return rows.map(HabitModel.fromMap).map((HabitModel model) => model.toEntity()).toList();
  }

  @override
  Future<void> updateHabit(HabitEntity habit) async {
    final HabitModel model = HabitModel.fromEntity(habit);
    await _localDataSource.update(
      'habits',
      model.toMap()..remove('id'),
      where: 'id = ?',
      whereArgs: <Object?>[habit.id],
    );
  }

  @override
  Future<void> deleteHabit(int id) async {
    await _localDataSource.delete(
      'habits',
      where: 'id = ?',
      whereArgs: <Object?>[id],
    );
  }

  @override
  Future<int> createCategory(HabitCategoryEntity category) {
    final HabitCategoryModel model = HabitCategoryModel.fromEntity(category);
    return _localDataSource.insert(
      'habit_categories',
      model.toMap()..remove('id'),
    );
  }

  @override
  Future<List<HabitCategoryEntity>> getCategories() async {
    final List<Map<String, Object?>> rows = await _localDataSource.queryAll(
      'habit_categories',
      orderBy: 'id DESC',
    );
    return rows
        .map(HabitCategoryModel.fromMap)
        .map((HabitCategoryModel model) => model.toEntity())
        .toList();
  }

  @override
  Future<void> updateCategory(HabitCategoryEntity category) async {
    final HabitCategoryModel model = HabitCategoryModel.fromEntity(category);
    await _localDataSource.update(
      'habit_categories',
      model.toMap()..remove('id'),
      where: 'id = ?',
      whereArgs: <Object?>[category.id],
    );
  }

  @override
  Future<void> deleteCategory(int id) async {
    await _localDataSource.delete(
      'habit_categories',
      where: 'id = ?',
      whereArgs: <Object?>[id],
    );
  }

  @override
  Future<int> createSchedule(HabitScheduleEntity schedule) {
    final HabitScheduleModel model = HabitScheduleModel.fromEntity(schedule);
    return _localDataSource.insert(
      'habit_schedules',
      model.toMap()..remove('id'),
    );
  }

  @override
  Future<List<HabitScheduleEntity>> getSchedulesByHabitId(int habitId) async {
    final List<Map<String, Object?>> rows = await _localDataSource.queryAll(
      'habit_schedules',
      where: 'habit_id = ?',
      whereArgs: <Object?>[habitId],
      orderBy: 'id DESC',
    );

    return rows
        .map(HabitScheduleModel.fromMap)
        .map((HabitScheduleModel model) => model.toEntity())
        .toList();
  }

  @override
  Future<void> updateSchedule(HabitScheduleEntity schedule) async {
    final HabitScheduleModel model = HabitScheduleModel.fromEntity(schedule);
    await _localDataSource.update(
      'habit_schedules',
      model.toMap()..remove('id'),
      where: 'id = ?',
      whereArgs: <Object?>[schedule.id],
    );
  }

  @override
  Future<void> deleteSchedule(int id) async {
    await _localDataSource.delete(
      'habit_schedules',
      where: 'id = ?',
      whereArgs: <Object?>[id],
    );
  }

  @override
  Future<int> createCompletion(HabitCompletionEntity completion) {
    final HabitCompletionModel model = HabitCompletionModel.fromEntity(completion);
    return _localDataSource.insert(
      'habit_completions',
      model.toMap()..remove('id'),
    );
  }

  @override
  Future<List<HabitCompletionEntity>> getCompletionsByHabitId(int habitId) async {
    final List<Map<String, Object?>> rows = await _localDataSource.queryAll(
      'habit_completions',
      where: 'habit_id = ?',
      whereArgs: <Object?>[habitId],
      orderBy: 'completion_date DESC',
    );

    return rows
        .map(HabitCompletionModel.fromMap)
        .map((HabitCompletionModel model) => model.toEntity())
        .toList();
  }

  @override
  Future<void> updateCompletion(HabitCompletionEntity completion) async {
    final HabitCompletionModel model = HabitCompletionModel.fromEntity(completion);
    await _localDataSource.update(
      'habit_completions',
      model.toMap()..remove('id'),
      where: 'id = ?',
      whereArgs: <Object?>[completion.id],
    );
  }

  @override
  Future<void> deleteCompletion(int id) async {
    await _localDataSource.delete(
      'habit_completions',
      where: 'id = ?',
      whereArgs: <Object?>[id],
    );
  }

  @override
  Future<int> createReminder(HabitReminderEntity reminder) {
    final HabitReminderModel model = HabitReminderModel.fromEntity(reminder);
    return _localDataSource.insert(
      'habit_reminders',
      model.toMap()..remove('id'),
    );
  }

  @override
  Future<List<HabitReminderEntity>> getRemindersByHabitId(int habitId) async {
    final List<Map<String, Object?>> rows = await _localDataSource.queryAll(
      'habit_reminders',
      where: 'habit_id = ?',
      whereArgs: <Object?>[habitId],
      orderBy: 'id DESC',
    );

    return rows
        .map(HabitReminderModel.fromMap)
        .map((HabitReminderModel model) => model.toEntity())
        .toList();
  }

  @override
  Future<void> updateReminder(HabitReminderEntity reminder) async {
    final HabitReminderModel model = HabitReminderModel.fromEntity(reminder);
    await _localDataSource.update(
      'habit_reminders',
      model.toMap()..remove('id'),
      where: 'id = ?',
      whereArgs: <Object?>[reminder.id],
    );
  }

  @override
  Future<void> deleteReminder(int id) async {
    await _localDataSource.delete(
      'habit_reminders',
      where: 'id = ?',
      whereArgs: <Object?>[id],
    );
  }
}
