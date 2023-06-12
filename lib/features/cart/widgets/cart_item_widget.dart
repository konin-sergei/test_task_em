import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task_em/core/models/cart_item.dart';
import 'package:test_task_em/features/cart/bloc/cart_bloc.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  const CartItemWidget(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 0, right: 8, top: 0, bottom: 8),
          height: 62,
          width: 62,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color(0xFFF8F7F5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.network(
              item.dish.imageUrl,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.dish.name,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Row(
                children: [
                  Text(
                    '${item.dish.price} ₽ ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "· ${item.dish.weight} г",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color(0x40000000),
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  context.read<CartBloc>().add(CartItemRemoved(item));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFEFEEEC),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  height: 32,
                  padding: const EdgeInsets.all(4),
                  child: SvgPicture.asset(
                    "assets/icons/minus.svg",
                    colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 32,
                width: 40,
                //padding: const EdgeInsets.all(7),
                color: const Color(0xFFEFEEEC),
                child: Text(
                  item.count.toString(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<CartBloc>().add(CartItemAdded(item));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Color(0xFFEFEEEC),
                  ),
                  height: 32,
                  padding: const EdgeInsets.all(4),
                  child: SvgPicture.asset(
                    "assets/icons/plus.svg",
                    colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
