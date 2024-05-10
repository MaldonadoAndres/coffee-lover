import 'package:cofee_lover/features/favorites/pages/favorite_coffee_page.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CoffeeLoverAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CoffeeLoverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Coffee Lover'),
      actions: [
        IconButton(
          onPressed: () {
            //I did it this way insted of using routing because there's only two pages
            // and I don't want to overcomplicate the code
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavoriteCoffeePage(),
              ),
            );
          },
          icon: const Icon(
            PhosphorIconsRegular.coffee,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
