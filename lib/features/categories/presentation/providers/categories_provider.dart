import 'package:flutter/material.dart';
import 'package:habit_now_clone/features/categories/domain/repositories/category_repository.dart';
import 'package:repository/repository.dart';

class CategoriesProvider with ChangeNotifier {
  CategoriesProvider(this._repository) {
    _load();
  }

  final CategoryRepository _repository;

  List<Category> _defaultCategories = <Category>[];
  List<Category> _customCategories = <Category>[];

  List<Category> get defaultCategories => _defaultCategories;
  List<Category> get customCategories => _customCategories;

  void _load() {
    _defaultCategories = _repository.getDefaultCategories();
    _customCategories = _repository.getCustomCategories();
  }
}
