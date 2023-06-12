import 'package:test_task_em/core/models/cart_item.dart';

class CartRepository {
  final _items = <CartItem>[];

  List<CartItem> loadCartItems() => _items;

  bool hasItem(dish) {
    for (var currentItem in _items) {
      if (currentItem.dish == dish) {
        return true;
      }
    }
    return false;
  }

  void addItemToCart(CartItem item) {
    bool hasInCart = false;
    for (var currentItem in _items) {
      if (currentItem.dish == item.dish) {
        currentItem.count = currentItem.count + 1;
        hasInCart = true;
        break;
      }
    }
    if (hasInCart == false) {
      _items.add(item);
    }
  }

  void removeItemFromCart(CartItem item) {
    bool needRemove = true;
    for (var currentItem in _items) {
      if (currentItem.dish == item.dish) {
        if (currentItem.count > 1) {
          currentItem.count = currentItem.count - 1;
          needRemove = false;
          break;
        }
      }
    }
    if (needRemove == true) {
      _items.removeWhere((currentItem) => currentItem.dish == item.dish);
    }
  }
}
