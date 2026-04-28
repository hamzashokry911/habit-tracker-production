import 'package:flutter/material.dart';
import 'package:habit_now_clone/features/checkables/presentation/providers/checkables_provider.dart';
import 'package:habit_now_clone/i18n/en/strings.g.dart';
import 'package:provider/provider.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ColoredTabBar(
          color: AppColors.darkerGrey,
          extraWidget: IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {},
            splashRadius: 1,
            constraints: const BoxConstraints(),
            padding: const EdgeInsetsDirectional.only(end: Dimens.size16),
          ),
          tabBar: TabBar(
            isScrollable: true,
            labelStyle: Theme.of(context).textTheme.bodySmall,
            tabs: [
              Tab(text: t.single_tasks, height: Dimens.size32),
              Tab(text: t.recurring_tasks, height: Dimens.size32),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildSingleTasksList(context),
            _buildRecurringTasksList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleTasksList(BuildContext context) => CheckableListView(
        context.watch<CheckablesProvider>().singleTasks,
        mode: ScreenMode.tasks,
      );

  Widget _buildRecurringTasksList(BuildContext context) => CheckableListView(
        context.watch<CheckablesProvider>().recurringTasks,
        mode: ScreenMode.tasks,
      );
}
