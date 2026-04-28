import 'package:habit_now_clone/features/checkables/domain/repositories/checkable_repository.dart';
import 'package:habit_now_clone/utils/mocks/mock_habits.dart';
import 'package:habit_now_clone/utils/mocks/mock_tasks.dart';
import 'package:repository/repository.dart';

class MockCheckableRepository implements CheckableRepository {
  @override
  List<Checkable> getTodayEntries() => <Checkable>[
        ...mockTasksList,
        ...mockHabitsList,
      ];

  @override
  List<Habit> getActiveHabits() =>
      mockHabitsList.where((Habit habit) => !habit.archived).toList();

  @override
  List<Habit> getArchivedHabits() =>
      mockHabitsList.where((Habit habit) => habit.archived).toList();

  @override
  List<Task> getSingleTasks() =>
      mockTasksList.where((Task task) => !task.recurring).toList();

  @override
  List<Task> getRecurringTasks() =>
      mockTasksList.where((Task task) => task.recurring).toList();
}
