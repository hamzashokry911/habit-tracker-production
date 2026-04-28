import 'package:flutter_test/flutter_test.dart';
import 'package:habit_now_clone/features/habit_records/data/models/habit_schedule_model.dart';
import 'package:habit_now_clone/features/habit_records/domain/entities/habit_schedule_entity.dart';

void main() {
  group('HabitScheduleModel', () {
    test('toMap/fromMap preserves list and enum values', () {
      const HabitScheduleModel model = HabitScheduleModel(
        id: 7,
        habitId: 3,
        type: HabitScheduleType.weekly,
        intervalDays: null,
        daysOfWeek: <int>[1, 3, 5],
        daysOfMonth: null,
        startDate: const DateTime(2026, 4, 28),
      );

      final Map<String, Object?> map = model.toMap();
      final HabitScheduleModel restored = HabitScheduleModel.fromMap(map);

      expect(restored.id, model.id);
      expect(restored.habitId, model.habitId);
      expect(restored.type, model.type);
      expect(restored.daysOfWeek, model.daysOfWeek);
      expect(restored.startDate, model.startDate);
    });

    test('fromEntity/toEntity roundtrip preserves values', () {
      const HabitScheduleEntity entity = HabitScheduleEntity(
        id: 9,
        habitId: 4,
        type: HabitScheduleType.interval,
        intervalDays: 2,
        daysOfWeek: null,
        daysOfMonth: null,
        startDate: const DateTime(2026, 1, 1),
      );

      final HabitScheduleModel model = HabitScheduleModel.fromEntity(entity);
      final HabitScheduleEntity restored = model.toEntity();

      expect(restored.id, entity.id);
      expect(restored.habitId, entity.habitId);
      expect(restored.type, entity.type);
      expect(restored.intervalDays, entity.intervalDays);
      expect(restored.startDate, entity.startDate);
    });
  });
}
