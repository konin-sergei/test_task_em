import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/category_bloc.dart';
import 'bloc/category_event.dart';
import 'bloc/category_state.dart';
import 'widgets/grid_element_widget.dart';

class CategoryPage extends StatelessWidget {
  final String nameCategory;

  const CategoryPage({super.key, required this.nameCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: false,
        titleSpacing: 0.0,
        title: Text(
          nameCategory,
          style: const TextStyle(
            fontFamily: 'San Francisco Pro Display',
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: const <Widget>[
          Image(
            image: AssetImage('assets/images/user.png'),
          ),
        ],
      ),
      body: const CategoryPageBody(),
    );
  }
}

class CategoryPageBody extends StatelessWidget {
  const CategoryPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryBloc()..add(CategoryGetEvent()),
      child: BlocBuilder<CategoryBloc, CategoryBaseState>(
        builder: (context, state) {
          if (state is CategoryInProgressState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CategoryFailureState) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is CategoryGotState) {
            return Column(
              children: [
                Container(
                  height: 35,
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.only(left: 16),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      state.tags.length,
                      (index) => GestureDetector(
                        onTap: () {
                          context.read<CategoryBloc>().add(CategoryFilterEvent(state.tags.elementAt(index)));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: (state.tags.elementAt(index) == state.activeTag) ? const Color(0xFF3364E0) : const Color(0xFFF8F7F5),
                          ),
                          padding: const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 16),
                          child: Text(
                            state.tags.elementAt(index),
                            style: TextStyle(
                              color: (state.tags.elementAt(index) == state.activeTag) ? Colors.white : Colors.black,
                              fontFamily: 'SF Pro Display',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 3,
                    children: List.generate(
                      state.dishes.length,
                      (index) {
                        return GridElementWidget(
                          dish: state.dishes[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
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
