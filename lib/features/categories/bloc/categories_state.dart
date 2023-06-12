import 'package:test_task_em/core/models/category.dart';

abstract class CategoriesBaseState {}

class CategoriesInitState extends CategoriesBaseState {
  CategoriesInitState();
}

class CategoriesInProgressState extends CategoriesBaseState {
  CategoriesInProgressState();
}

class CategoriesGotState extends CategoriesBaseState {
  final List<Category> categories;

  CategoriesGotState({required this.categories});
}

class CategoriesFailureState extends CategoriesBaseState {
  final String error;

  CategoriesFailureState(this.error);
}
