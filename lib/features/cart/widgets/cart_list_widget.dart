import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_em/features/cart/bloc/cart_bloc.dart';
import 'package:test_task_em/features/cart/widgets/cart_item_widget.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const CircularProgressIndicator();
        }
        if (state is CartLoaded) {
          return ListView.separated(
            itemCount: state.cart.items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 4),
            itemBuilder: (context, index) {
              final item = state.cart.items[index];
              return CartItemWidget( item);
            },
          );
        }
        return const Text('Something went wrong!');
      },
    );
  }
}
