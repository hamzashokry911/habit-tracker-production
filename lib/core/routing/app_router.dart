import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_now_clone/app/app_scaffold.dart';
import 'package:habit_now_clone/screens/categories/view/categories_view.dart';
import 'package:habit_now_clone/screens/habits/view/habits_view.dart';
import 'package:habit_now_clone/screens/tasks/view/tasks_view.dart';
import 'package:habit_now_clone/screens/today/view/today_view.dart';
import 'package:habit_now_clone/utils/navigation.dart';
import 'package:styleguide/style.dart';

GoRouter createAppRouter() => GoRouter(
      initialLocation: Paths.today,
      routes: [
        ShellRoute(
          builder: (_, __, Widget child) => AppScaffold(child),
          routes: [
            GoRoute(
              path: Paths.today,
              builder: (_, __) => const TodayView(),
            ),
            GoRoute(
              path: Paths.habits,
              builder: (_, __) => const HabitsView(),
            ),
            GoRoute(
              path: Paths.tasks,
              builder: (_, __) => const TasksView(),
            ),
          ],
        ),
        GoRoute(
          path: Paths.categories,
          pageBuilder: (_, GoRouterState state) => CustomTransitionPage<void>(
            key: state.pageKey,
            transitionDuration: AppTimes.millis200,
            child: const CategoriesView(),
            transitionsBuilder:
                (_, Animation<double> animation, __, Widget child) =>
                    FadeTransition(opacity: animation, child: child),
          ),
        ),
      ],
    );
