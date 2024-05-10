import 'package:cofee_lover/domain/repositories/i_coffee_repository.dart';
import 'package:cofee_lover/domain/use_cases/get_random_coffee_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCoffeeRepository extends Mock implements ICoffeeRepository {}

void main() {
  late GetRandomCoffeeUseCase getRandomCoffeeUseCase;
  late MockCoffeeRepository mockCoffeeRepository;

  setUp(() {
    mockCoffeeRepository = MockCoffeeRepository();
    getRandomCoffeeUseCase = GetRandomCoffeeUseCase(coffeeRepository: mockCoffeeRepository);
  });

  group('call', () {
    test('should return a random coffee image file', () async {
      // Arrange
      const expectedFile = 'coffee_image.jpg';
      when(() => mockCoffeeRepository.getRandomCoffee()).thenAnswer((_) async => expectedFile);

      // Act
      final result = await getRandomCoffeeUseCase.call();

      // Assert
      expect(result, expectedFile);
      verify(() => mockCoffeeRepository.getRandomCoffee());
      verifyNoMoreInteractions(mockCoffeeRepository);
    });
  });
}
