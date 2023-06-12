import 'package:flutter/material.dart';
import 'package:test_task_em/core/widgets/appbar_widget.dart';
import 'package:test_task_em/features/cart/widgets/cart_button_widget.dart';
import 'package:test_task_em/features/cart/widgets/cart_list_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CartListWidget(),
            ),
          ),
          CartButton(),
        ],
      ),
    );
  }
}

