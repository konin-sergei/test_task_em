import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(const Color(0xFF3364E0)),
        ),
        onPressed: () {},
        child: const Text(
          "Добавить в корзину",
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
