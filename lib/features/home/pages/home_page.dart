import 'package:cofee_lover/core/widgets/animated_reaction.dart';
import 'package:cofee_lover/features/home/provider/home_provider.dart';
import 'package:cofee_lover/features/home/widgets/coffee_lover_app_bar.dart';
import 'package:cofee_lover/features/home/widgets/coffee_lover_image.dart';
import 'package:cofee_lover/features/home/widgets/like_dislike_coffee_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showAnimation = useState(false);
    ref.listen(saveToLocalProvider, (previous, next) {
      if (next is AsyncData) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Saved to favorites'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    });
    return Scaffold(
      appBar: const CoffeeLoverAppBar(),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const CoffeeLoverImage(),
                  Visibility(
                    visible: showAnimation.value,
                    child: AnimatedReaction(
                      onAnimEnd: () {
                        showAnimation.value = false;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            LikeDislikeCoffeBar(
              onLike: () {
                showAnimation.value = true;
              },
            ),
          ],
        ),
      ),
    );
  }
}
