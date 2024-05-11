import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedReaction extends HookWidget {
  const AnimatedReaction({super.key, required this.onAnimEnd});
  final Function() onAnimEnd;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final animation = TweenSequence(
      [
        TweenSequenceItem(
          tween: Tween<double>(begin: 1.0, end: 1.8),
          weight: 0.5,
        ),
        TweenSequenceItem(
          tween: Tween<double>(begin: 1.8, end: 1.0),
          weight: 0.5,
        ),
      ],
    ).animate(animationController);
    animationController.forward();
    animation.addListener(() {
      if (animation.isCompleted) {
        onAnimEnd();
      }
    });
    return AnimatedBuilder(
      animation: animation,
      builder: (_, child) {
        return Transform.scale(
          scale: animation.value,
          child: child,
        );
      },
      child: const Icon(
        Icons.favorite,
        color: Color(0xFF5A3916),
        size: 48,
      ),
    );
  }
}
