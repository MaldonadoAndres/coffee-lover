import 'package:cached_network_image/cached_network_image.dart';
import 'package:cofee_lover/features/favorites/providers/favorite_coffee_provider.dart';
import 'package:cofee_lover/features/home/widgets/coffee_image_loader_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteCoffeePage extends HookConsumerWidget {
  const FavoriteCoffeePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteCoffees = ref.watch(getFavoriteCoffeesProvider);
    final currentImage = useState('');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Coffees'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Center(
          child: favoriteCoffees.when(
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Center(
              child: CoffeeImageLoaderError(
                error: error.toString(),
                onRetry: () => ref.refresh(getFavoriteCoffeesProvider),
              ),
            ),
            data: (data) {
              if (data.isEmpty) {
                return const Text(
                  'No favorite coffee yet.\nKeep exploring!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                );
              }
              if (currentImage.value.isEmpty) {
                currentImage.value = data.first;
              }
              return Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: CachedNetworkImage(
                      imageUrl: currentImage.value,
                      imageBuilder: (context, imageProvider) => ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: PageView.builder(
                      itemCount: data.length,
                      controller: PageController(
                        viewportFraction: 0.3,
                        initialPage: 0,
                      ),
                      onPageChanged: (index) {
                        currentImage.value = data[index];
                      },
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: CachedNetworkImage(
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            imageUrl: data[index],
                            imageBuilder: (context, imageProvider) => ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
