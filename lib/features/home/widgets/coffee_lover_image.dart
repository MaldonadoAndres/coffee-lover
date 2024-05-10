import 'package:cached_network_image/cached_network_image.dart';
import 'package:cofee_lover/core/widgets/coffee_loader.dart';
import 'package:cofee_lover/features/home/provider/home_provider.dart';
import 'package:cofee_lover/features/home/widgets/coffee_image_loader_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoffeeLoverImage extends ConsumerWidget {
  const CoffeeLoverImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomCoffeeProvider = ref.watch(getRandomCoffeeProvider);
    return randomCoffeeProvider.when(
      loading: () => const CoffeeLoader(),
      error: (error, _) {
        return CoffeeImageLoaderError(
          error: error.toString(),
          onRetry: () => ref.invalidate(getRandomCoffeeProvider),
        );
      },
      data: (data) {
        return CachedNetworkImage(
          imageUrl: data,
          placeholder: (context, url) => const CoffeeLoader(),
          imageBuilder: (context, imageProvider) => ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
