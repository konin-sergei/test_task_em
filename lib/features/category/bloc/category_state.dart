import 'package:test_task_em/core/models/dish.dart';

abstract class CategoryBaseState {

}

class CategoryInitState extends CategoryBaseState {
  CategoryInitState();
}

class CategoryInProgressState extends CategoryBaseState {
  CategoryInProgressState();
}

class CategoryGotState extends CategoryBaseState {

  final List<Dish> dishes;///поля классов final
  final Set<String> tags;
  final String activeTag;
  CategoryGotState({required this.dishes, required this.tags, required this.activeTag });
}

class CategoryFailureState extends CategoryBaseState {
  final String error;///поля классов final

  CategoryFailureState(this.error);
}

