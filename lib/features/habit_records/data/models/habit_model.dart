import 'package:habit_now_clone/features/habit_records/domain/entities/habit_entity.dart';

class HabitModel {
  const HabitModel({
    this.id,
    required this.name,
    this.categoryId,
    required this.archived,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String name;
  final int? categoryId;
  final bool archived;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory HabitModel.fromEntity(HabitEntity entity) => HabitModel(
        id: entity.id,
        name: entity.name,
        categoryId: entity.categoryId,
        archived: entity.archived,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );

  HabitEntity toEntity() => HabitEntity(
        id: id,
        name: name,
        categoryId: categoryId,
        archived: archived,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  Map<String, Object?> toMap() => <String, Object?>{
        'id': id,
        'name': name,
        'category_id': categoryId,
        'archived': archived ? 1 : 0,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  factory HabitModel.fromMap(Map<String, Object?> map) => HabitModel(
        id: map['id'] as int?,
        name: map['name'] as String,
        categoryId: map['category_id'] as int?,
        archived: (map['archived'] as int? ?? 0) == 1,
        createdAt: DateTime.parse(map['created_at'] as String),
        updatedAt: DateTime.parse(map['updated_at'] as String),
      );
}
