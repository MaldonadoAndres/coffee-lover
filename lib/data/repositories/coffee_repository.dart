import 'package:cofee_lover/core/exceptions/custom_exception.dart';
import 'package:cofee_lover/data/datasources/api/coffee_lover_api.dart';
import 'package:cofee_lover/domain/repositories/i_coffee_repository.dart';

class CoffeeRepository implements ICoffeeRepository {
  final CoffeeLoverApi _api;

  CoffeeRepository({required CoffeeLoverApi api}) : _api = api;

  @override
  Future<String> getRandomCoffee() async {
    try {
      final response = await _api.getRandomCoffee();
      return response.file;
    } catch (e) {
      throw CustomException(
        'Something went wrong while fetching random coffee image.You can still look at your favorites.',
      );
    }
  }
}
