import 'package:flutter/material.dart';
import 'package:test_task_em/app.dart';
import 'package:test_task_em/core/repository/cart_repository.dart';

void main() {
  runApp(App(cartRepository: CartRepository()));
}

