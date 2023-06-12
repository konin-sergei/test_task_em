import 'cart_item.dart';


class Cart {
  const Cart({this.items = const <CartItem>[]});

  final List<CartItem> items;
}
