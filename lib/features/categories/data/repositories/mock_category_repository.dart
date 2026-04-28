import 'package:habit_now_clone/features/categories/domain/repositories/category_repository.dart';
import 'package:habit_now_clone/utils/mocks/mock_categories.dart';
import 'package:repository/repository.dart';

class MockCategoryRepository implements CategoryRepository {
  @override
  List<Category> getDefaultCategories() => List<Category>.unmodifiable(
        categoriesList,
      );

  @override
  List<Category> getCustomCategories() => List<Category>.unmodifiable(
        customCategoriesList,
      );
}
