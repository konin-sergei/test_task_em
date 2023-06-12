import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:test_task_em/core/models/cart.dart';
import 'package:test_task_em/core/models/cart_item.dart';
import 'package:test_task_em/core/repository/cart_repository.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.cartRepository}) : super(CartLoading()) {
    on<CartStarted>(_onStarted);
    on<CartItemAdded>(_onItemAdded);
    on<CartItemRemoved>(_onItemRemoved);
  }

  final CartRepository cartRepository;

  Future<void> _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    final items = cartRepository.loadCartItems();
    emit(CartLoaded(cart: Cart(items: [...items])));
  }

  Future<void> _onItemAdded(CartItemAdded event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded) {
      cartRepository.addItemToCart(event.item);
      final items = cartRepository.loadCartItems();
      emit(CartLoaded(cart: Cart(items: [...items])));
    }
  }

  void _onItemRemoved(CartItemRemoved event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      cartRepository.removeItemFromCart(event.item);
      final items = cartRepository.loadCartItems();
      emit(CartLoaded(cart: Cart(items: [...items])));
    }
  }
}
