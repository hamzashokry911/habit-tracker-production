class HabitEntity {
  const HabitEntity({
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
}
