import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._();

  static final AppDatabase instance = AppDatabase._();

  static const String _dbName = 'momentum_habits.db';
  static const int _dbVersion = 1;

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _open();
    return _database!;
  }

  Future<Database> _open() async {
    final String dbPath = await getDatabasesPath();
    final String path = p.join(dbPath, _dbName);

    return openDatabase(
      path,
      version: _dbVersion,
      onConfigure: (Database db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE habit_categories(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            color_hex TEXT NOT NULL,
            icon_name TEXT NOT NULL,
            created_at TEXT NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE habits(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            category_id INTEGER,
            archived INTEGER NOT NULL DEFAULT 0,
            created_at TEXT NOT NULL,
            updated_at TEXT NOT NULL,
            FOREIGN KEY(category_id) REFERENCES habit_categories(id)
              ON DELETE SET NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE habit_schedules(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            habit_id INTEGER NOT NULL,
            type TEXT NOT NULL,
            interval_days INTEGER,
            days_of_week TEXT,
            days_of_month TEXT,
            start_date TEXT NOT NULL,
            FOREIGN KEY(habit_id) REFERENCES habits(id)
              ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE habit_completions(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            habit_id INTEGER NOT NULL,
            completion_date TEXT NOT NULL,
            status TEXT NOT NULL,
            note TEXT,
            UNIQUE(habit_id, completion_date),
            FOREIGN KEY(habit_id) REFERENCES habits(id)
              ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE habit_reminders(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            habit_id INTEGER NOT NULL,
            time_of_day TEXT NOT NULL,
            enabled INTEGER NOT NULL DEFAULT 1,
            FOREIGN KEY(habit_id) REFERENCES habits(id)
              ON DELETE CASCADE
          )
        ''');
      },
    );
  }
}
