import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryWidget extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CategoryWidget({required this.name, required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.go("/categories/category/$name");
        // context.goNamed(
        //   'category',
        //   pathParameters: <String, String>{'nameCategory': name},
        // );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 12, left: 16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.topLeft,
        height: 148,
        child: SizedBox(
          width: 191,
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            softWrap: true,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
