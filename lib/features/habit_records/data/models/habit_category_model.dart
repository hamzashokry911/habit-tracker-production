import 'package:habit_now_clone/features/habit_records/domain/entities/habit_category_entity.dart';

class HabitCategoryModel {
  const HabitCategoryModel({
    this.id,
    required this.name,
    required this.colorHex,
    required this.iconName,
    required this.createdAt,
  });

  final int? id;
  final String name;
  final String colorHex;
  final String iconName;
  final DateTime createdAt;

  factory HabitCategoryModel.fromEntity(HabitCategoryEntity entity) =>
      HabitCategoryModel(
        id: entity.id,
        name: entity.name,
        colorHex: entity.colorHex,
        iconName: entity.iconName,
        createdAt: entity.createdAt,
      );

  HabitCategoryEntity toEntity() => HabitCategoryEntity(
        id: id,
        name: name,
        colorHex: colorHex,
        iconName: iconName,
        createdAt: createdAt,
      );

  Map<String, Object?> toMap() => <String, Object?>{
        'id': id,
        'name': name,
        'color_hex': colorHex,
        'icon_name': iconName,
        'created_at': createdAt.toIso8601String(),
      };

  factory HabitCategoryModel.fromMap(Map<String, Object?> map) => HabitCategoryModel(
        id: map['id'] as int?,
        name: map['name'] as String,
        colorHex: map['color_hex'] as String,
        iconName: map['icon_name'] as String,
        createdAt: DateTime.parse(map['created_at'] as String),
      );
}
