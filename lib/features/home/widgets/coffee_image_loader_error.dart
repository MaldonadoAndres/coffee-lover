import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CoffeeImageLoaderError extends StatelessWidget {
  const CoffeeImageLoaderError({super.key, required this.error, required this.onRetry});
  final String error;
  final Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          error.toString(),
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        IconButton(
          onPressed: onRetry,
          iconSize: 32,
          icon: const Icon(
            PhosphorIconsRegular.arrowClockwise,
          ),
        )
      ],
    );
  }
}
