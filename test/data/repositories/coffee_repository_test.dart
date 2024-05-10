import 'package:cofee_lover/core/exceptions/custom_exception.dart';
import 'package:cofee_lover/data/datasources/api/coffee_lover_api.dart';
import 'package:cofee_lover/data/models/random_coffee_response.dart';
import 'package:cofee_lover/data/repositories/coffee_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCoffeeLoverApi extends Mock implements CoffeeLoverApi {}

void main() {
  late CoffeeRepository coffeeRepository;
  late MockCoffeeLoverApi mockApi;

  setUp(() {
    mockApi = MockCoffeeLoverApi();
    coffeeRepository = CoffeeRepository(api: mockApi);
  });

  group('getRandomCoffee', () {
    test('should return a random coffee image file', () async {
      // Arrange
      const expectedFile = 'coffee_image.jpg';
      when(() => mockApi.getRandomCoffee()).thenAnswer((_) async => RandomCoffeeResponse(file: expectedFile));

      // Act
      final result = await coffeeRepository.getRandomCoffee();

      // Assert
      expect(result, expectedFile);
      verify(() => mockApi.getRandomCoffee());
      verifyNoMoreInteractions(mockApi);
    });

    test('should throw a CustomException when an error occurs', () async {
      // Arrange
      when(() => mockApi.getRandomCoffee()).thenThrow(Exception());

      // Act
      final call = coffeeRepository.getRandomCoffee;

      // Assert
      expect(call(), throwsA(isA<CustomException>()));
      verify(() => mockApi.getRandomCoffee());
      verifyNoMoreInteractions(mockApi);
    });
  });
}
