import 'package:repository/repository.dart';

abstract class CategoryRepository {
  List<Category> getDefaultCategories();
  List<Category> getCustomCategories();
}
