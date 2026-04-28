import 'package:habit_now_clone/core/database/app_database.dart';
import 'package:sqflite/sqflite.dart';

class HabitRecordsLocalDataSource {
  HabitRecordsLocalDataSource(this._appDatabase);

  final AppDatabase _appDatabase;

  Future<Database> get _db async => _appDatabase.database;

  Future<int> insert(String table, Map<String, Object?> values) async {
    final Database db = await _db;
    return db.insert(table, values);
  }

  Future<List<Map<String, Object?>>> queryAll(
    String table, {
    String? where,
    List<Object?>? whereArgs,
    String? orderBy,
  }) async {
    final Database db = await _db;
    return db.query(
      table,
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
    );
  }

  Future<int> update(
    String table,
    Map<String, Object?> values, {
    required String where,
    required List<Object?> whereArgs,
  }) async {
    final Database db = await _db;
    return db.update(
      table,
      values,
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future<int> delete(
    String table, {
    required String where,
    required List<Object?> whereArgs,
  }) async {
    final Database db = await _db;
    return db.delete(
      table,
      where: where,
      whereArgs: whereArgs,
    );
  }
}
