import 'package:cofee_lover/features/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LikeDislikeCoffeBar extends ConsumerWidget {
  const LikeDislikeCoffeBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomCoffeProvider = ref.watch(getRandomCoffeeProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF38220F).withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                if (randomCoffeProvider.isRefreshing) {
                  return;
                }
                ref.invalidate(getRandomCoffeeProvider);
              },
              color: Colors.white,
              disabledColor: Colors.white,
              icon: const Icon(
                PhosphorIconsRegular.thumbsDown,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF38220F).withOpacity(0.8),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                if (randomCoffeProvider.isRefreshing) {
                  return;
                }
                ref.read(saveToLocalProvider.notifier).save(randomCoffeProvider.value ?? '');
                ref.invalidate(getRandomCoffeeProvider);
              },
              color: Colors.white,
              disabledColor: Colors.white,
              icon: const Icon(
                PhosphorIconsRegular.heart,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
