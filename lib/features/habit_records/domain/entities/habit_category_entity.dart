class HabitCategoryEntity {
  const HabitCategoryEntity({
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
}
