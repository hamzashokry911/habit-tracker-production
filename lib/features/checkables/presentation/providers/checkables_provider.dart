import 'package:flutter/material.dart';
import 'package:habit_now_clone/features/checkables/domain/repositories/checkable_repository.dart';
import 'package:repository/repository.dart';

class CheckablesProvider with ChangeNotifier {
  CheckablesProvider(this._repository) {
    _load();
  }

  final CheckableRepository _repository;

  List<Checkable> _todayEntries = <Checkable>[];
  List<Habit> _activeHabits = <Habit>[];
  List<Habit> _archivedHabits = <Habit>[];
  List<Task> _singleTasks = <Task>[];
  List<Task> _recurringTasks = <Task>[];

  List<Checkable> get todayEntries => _todayEntries;
  List<Habit> get activeHabits => _activeHabits;
  List<Habit> get archivedHabits => _archivedHabits;
  List<Task> get singleTasks => _singleTasks;
  List<Task> get recurringTasks => _recurringTasks;

  void _load() {
    _todayEntries = _repository.getTodayEntries();
    _activeHabits = _repository.getActiveHabits();
    _archivedHabits = _repository.getArchivedHabits();
    _singleTasks = _repository.getSingleTasks();
    _recurringTasks = _repository.getRecurringTasks();
  }
}
