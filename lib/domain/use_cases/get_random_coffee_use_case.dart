import 'package:cofee_lover/domain/repositories/i_coffee_repository.dart';

class GetRandomCoffeeUseCase {
  final ICoffeeRepository _coffeeRepository;

  GetRandomCoffeeUseCase({required ICoffeeRepository coffeeRepository}) : _coffeeRepository = coffeeRepository;

  Future<String> call() => _coffeeRepository.getRandomCoffee();
}
