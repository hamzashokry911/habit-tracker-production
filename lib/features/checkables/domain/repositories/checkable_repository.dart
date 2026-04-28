import 'package:repository/repository.dart';

abstract class CheckableRepository {
  List<Checkable> getTodayEntries();
  List<Habit> getActiveHabits();
  List<Habit> getArchivedHabits();
  List<Task> getSingleTasks();
  List<Task> getRecurringTasks();
}
