import 'package:flutter/material.dart';
import 'package:habit_now_clone/app/app.dart';
import 'package:habit_now_clone/core/database/app_database.dart';
import 'package:habit_now_clone/features/categories/data/repositories/mock_category_repository.dart';
import 'package:habit_now_clone/features/categories/domain/repositories/category_repository.dart';
import 'package:habit_now_clone/features/categories/presentation/providers/categories_provider.dart';
import 'package:habit_now_clone/features/checkables/data/repositories/mock_checkable_repository.dart';
import 'package:habit_now_clone/features/checkables/domain/repositories/checkable_repository.dart';
import 'package:habit_now_clone/features/checkables/presentation/providers/checkables_provider.dart';
import 'package:habit_now_clone/features/habit_records/data/datasources/habit_records_local_data_source.dart';
import 'package:habit_now_clone/features/habit_records/data/repositories/local_habit_records_repository.dart';
import 'package:habit_now_clone/features/habit_records/domain/repositories/habit_records_repository.dart';
import 'package:habit_now_clone/i18n/en/strings.g.dart';
import 'package:habit_now_clone/providers/navigation_provider.dart';
import 'package:habit_now_clone/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  runApp(
    MultiProvider(
      providers: [
        Provider<CheckableRepository>(
          create: (_) => MockCheckableRepository(),
        ),
        Provider<CategoryRepository>(
          create: (_) => MockCategoryRepository(),
        ),
        Provider<AppDatabase>(
          create: (_) => AppDatabase.instance,
        ),
        Provider<HabitRecordsLocalDataSource>(
          create: (BuildContext context) => HabitRecordsLocalDataSource(
            context.read<AppDatabase>(),
          ),
        ),
        Provider<HabitRecordsRepository>(
          create: (BuildContext context) => LocalHabitRecordsRepository(
            context.read<HabitRecordsLocalDataSource>(),
          ),
        ),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (BuildContext context) => CheckablesProvider(
            context.read<CheckableRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CategoriesProvider(
            context.read<CategoryRepository>(),
          ),
        ),
      ],
      child: TranslationProvider(child: const App()),
    ),
  );
}
