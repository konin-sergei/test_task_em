import 'package:flutter/material.dart';
import 'package:test_task_em/core/models/dish.dart';

class  DishWidget extends StatelessWidget {
  final Dish dish;


  const  DishWidget({required this.dish, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFFF8F7F5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                dish.imageUrl,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          height: 35,
          alignment: Alignment.topLeft,
          child: Text(
            dish.name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
