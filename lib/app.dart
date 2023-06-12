import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_em/core/router/router.dart';
import 'package:test_task_em/core/repository/cart_repository.dart';
import 'core/theme.dart';
import 'features/cart/bloc/cart_bloc.dart';

class App extends StatelessWidget {
  const App({super.key, required this.cartRepository});

  final CartRepository cartRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc(
        cartRepository: cartRepository,
      )..add(CartStarted()),
      child: MaterialApp.router(
        routerConfig: goRouter,
        title: 'Test task EM',
        theme: theme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
