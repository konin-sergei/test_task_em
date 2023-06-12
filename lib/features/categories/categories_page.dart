import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_em/core/widgets/appbar_widget.dart';
import 'package:test_task_em/features/categories/widgets/category_widget.dart';


import 'bloc/categories_bloc.dart';
import 'bloc/categories_event.dart';
import 'bloc/categories_state.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(),
      body: CategoriesPageBody(),
    );
  }
}

class CategoriesPageBody extends StatelessWidget {
  const CategoriesPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoriesBloc()..add(CategoriesGetEvent()),
      child: BlocBuilder<CategoriesBloc, CategoriesBaseState>(
        builder: (context, state) {
          if (state is CategoriesInProgressState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CategoriesFailureState) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is CategoriesGotState) {
            return ListView.separated(
              padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
              itemCount: state.categories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryWidget(name: state.categories[index].name, imageUrl: state.categories[index].imageUrl);
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
