import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CoffeeLoader extends StatelessWidget {
  const CoffeeLoader({
    super.key,
    this.animationPath = 'assets/animations/coffee_loader.json',
  });
  final String animationPath;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(animationPath);
  }
}
