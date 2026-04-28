import 'package:flutter/material.dart';
import 'package:habit_now_clone/features/checkables/presentation/providers/checkables_provider.dart';
import 'package:habit_now_clone/i18n/en/strings.g.dart';
import 'package:provider/provider.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

class HabitsView extends StatelessWidget {
  const HabitsView({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: ColoredTabBar(
            color: AppColors.darkerGrey,
            tabBar: TabBar(
              labelPadding: const EdgeInsets.symmetric(
                horizontal: Dimens.size12,
              ),
              isScrollable: true,
              labelStyle: Theme.of(context).textTheme.bodySmall,
              tabs: [
                Tab(text: t.active_habits, height: Dimens.size32),
                Tab(text: t.archived, height: Dimens.size32),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _buildActiveHabitsList(context),
              _buildArchivedHabitsList(context),
            ],
          ),
        ),
      );

  Widget _buildActiveHabitsList(BuildContext context) => CheckableListView(
        context.watch<CheckablesProvider>().activeHabits,
        mode: ScreenMode.habits,
      );

  Widget _buildArchivedHabitsList(BuildContext context) => CheckableListView(
        context.watch<CheckablesProvider>().archivedHabits,
        mode: ScreenMode.habits,
      );
}
