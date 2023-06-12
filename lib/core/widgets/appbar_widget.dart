import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/location.svg",
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),

      centerTitle: false,
      titleSpacing: 0.0,
      //automaticallyImplyLeading: false,
      title: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Санкт-Петербург',
            style: TextStyle(
              fontFamily: 'San Francisco Pro Display',
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          Text(
            '12 Августа, 2023',
            style: TextStyle(
              fontFamily: 'San Francisco Pro Display',
              color: Color(0x80000000),
              fontSize: 14,
            ),
          ),
        ],
      ),
      actions: const <Widget>[
        Image(
          image: AssetImage('assets/images/user.png'),
        ),
      ],
    );
  }
}
