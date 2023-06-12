import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconModalWidget extends StatelessWidget {
  final String iconPath;

  const IconModalWidget({required this.iconPath, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, right: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: SvgPicture.asset(
        iconPath,
        colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ),
    );
  }
}
