import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_em/core/models/dish.dart';
import 'package:test_task_em/core/models/dishes.dart';
import 'package:test_task_em/core/repository/api_repository.dart';

import 'category_event.dart';
import 'category_state.dart';

// то ли  Dish то ли Categories
class CategoryBloc extends Bloc<CategoryBaseEvent, CategoryBaseState> {
  List<Dish> dishes = [];
  Set<String> tags = <String>{};

  CategoryBloc() : super(CategoryInitState()) {
    on<CategoryGetEvent>(_onCategoryGetEvent);
    on<CategoryFilterEvent>((event, emit) async {
      emit(await categoryFilter(event.tag));
    });
  }

  Future<void> _onCategoryGetEvent(CategoryGetEvent event, Emitter<CategoryBaseState> emit) async {
    emit(CategoryInProgressState());

    final apiRepository = ApiRepository(Dio());

    Dishes apiDishes = await apiRepository.getDishes();
    dishes = apiDishes.dishes;

    // Make this element first
    tags.add('Все меню');

    for (var dish in dishes) {
      List<String> currentTags = List<String>.from(dish.tags);
      tags.addAll(currentTags);
    }

    emit(CategoryGotState(dishes: dishes, tags: tags, activeTag: 'Все меню'));
  }

  Future<CategoryBaseState> categoryFilter(String tag) async {
    var filterDishes = dishes.where((element) => (element.tags.contains(tag))).toList();
    return CategoryGotState(dishes: filterDishes, tags: tags, activeTag: tag);
  }
}
