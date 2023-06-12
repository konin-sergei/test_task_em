import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_em/core/models/cart_item.dart';
import 'package:test_task_em/core/models/dish.dart';
import 'package:test_task_em/features/cart/bloc/cart_bloc.dart';

import 'dish_widget.dart';
import 'icon_modal_widget.dart';

class GridElementWidget extends StatelessWidget {
  final Dish dish;

  const GridElementWidget({required this.dish, super.key});

  @override
  Widget build(BuildContext context) {
    CartItem item = CartItem(dish, 1);
    //final isInCart = context.read<CartBloc>().cartRepository.hasItem(dish);

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  runSpacing: 8.0, // gap between lines
                  children: [
                    Container(
                      height: 232,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F7F5),
                        image: DecorationImage(
                          image: NetworkImage(dish.imageUrl),
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const IconModalWidget(iconPath: "assets/icons/favorites.svg"),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const IconModalWidget(iconPath: "assets/icons/close.svg"),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      dish.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Row(
                      children: [
                        Text(
                          dish.price.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          ' ₽ ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          "· ${dish.weight}г",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: const Color(0x40000000),
                              ),
                        ),
                      ],
                    ),
                    Text(
                      dish.description,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color(0xA6000000),
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                      width: 8,
                    ),
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all(const Color(0xFF3364E0)),
                        ),
                        onPressed: context.watch<CartBloc>().cartRepository.hasItem(dish) ? null : () => context.read<CartBloc>().add(CartItemAdded(item)),
                        child: context.watch<CartBloc>().cartRepository.hasItem(dish)
                            ? const Icon(Icons.check, semanticLabel: 'ADDED')
                            : const Text(
                                "Добавить в корзину",
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: DishWidget(dish: dish),
    );
  }
}
