import 'package:cofee_lover/features/home/widgets/coffee_image_loader_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void main() {
  group('CoffeeImageLoaderError', () {
    const error = 'Test Error';
    late Function() retryCallback;

    setUp(() {
      retryCallback = () {};
    });

    testWidgets('should display the error message', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CoffeeImageLoaderError(
              error: error,
              onRetry: retryCallback,
            ),
          ),
        ),
      );

      expect(find.text(error), findsOneWidget);
    });

    testWidgets('should call the retry callback when the retry button is pressed', (WidgetTester tester) async {
      bool retryCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CoffeeImageLoaderError(
              error: error,
              onRetry: () {
                retryCalled = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(PhosphorIconsRegular.arrowClockwise));
      await tester.pump();

      expect(retryCalled, isTrue);
    });
  });
}
