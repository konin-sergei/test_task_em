import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_em/core/models/categories.dart';
import 'package:test_task_em/core/repository/api_repository.dart';

import 'categories_event.dart';
import 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesBaseEvent, CategoriesBaseState> {
  CategoriesBloc() : super(CategoriesInitState()) {
    on<CategoriesGetEvent>((event, emit) async {
      emit(CategoriesInProgressState());
      emit(await categoryGet());
    });
  }

  Future<CategoriesBaseState> categoryGet() async {
    final apiService = ApiRepository(Dio());
    Categories categories = await apiService.getCategories();
    return CategoriesGotState(categories: categories.categories);
  }
}
