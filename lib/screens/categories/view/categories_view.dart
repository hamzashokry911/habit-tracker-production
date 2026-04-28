import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:habit_now_clone/features/categories/presentation/providers/categories_provider.dart';
import 'package:habit_now_clone/i18n/en/strings.g.dart';
import 'package:habit_now_clone/screens/categories/view/widgets/category_section.dart';
import 'package:habit_now_clone/screens/categories/view/widgets/restore_defaults_dialog.dart';
import 'package:styleguide/style.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoriesProvider provider = context.watch<CategoriesProvider>();

    return Scaffold(
      backgroundColor: AppColors.darkerGrey,
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            size: Dimens.size16,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          t.categories,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [_buildInfoButton()],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategorySection(
            title: t.custom_categories,
            subtitle: t.x_available(count: provider.customCategories.length),
            categoryList: provider.customCategories,
          ),
          AppSpaces.gap12,
          CategorySection(
            title: t.default_categories,
            subtitle: t.editable_for_premium_users,
            categoryList: provider.defaultCategories,
            restoreIcon: _buildRestoreIcon(context),
          ),
          Expanded(child: _buildNewCategoryButton(context)),
        ],
      ),
    );
  }

  IconButton _buildInfoButton() => IconButton(
        icon: const Icon(Icons.info_outline, color: AppColors.grey),
        onPressed: () => Fluttertoast.showToast(
          msg: t.tap_category_to_edit,
          backgroundColor: AppColors.grey.withValues(alpha: 0.2),
          textColor: Colors.white,
          fontSize: Dimens.size16,
        ),
      );

  IconButton _buildRestoreIcon(BuildContext context) => IconButton(
        onPressed: () => showDialog(
          context: context,
          builder: (_) => const RestoreDefaultsDialog(),
        ),
        icon: const Icon(Icons.loop),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      );

  Widget _buildNewCategoryButton(BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(Dimens.size12),
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(Dimens.size12),
              child: Text(t.new_category.toUpperCase()),
            ),
          ),
        ),
      );
}
