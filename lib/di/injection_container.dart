import 'package:cofee_lover/data/datasources/api/coffee_lover_api.dart';
import 'package:cofee_lover/data/repositories/coffee_repository.dart';
import 'package:cofee_lover/domain/repositories/i_coffee_repository.dart';
import 'package:cofee_lover/domain/use_cases/get_random_coffee_use_case.dart';
import 'package:get/instance_manager.dart';

class InjectionContainer {
  static void init() async {
    Get.lazyPut<CoffeeLoverApi>(() => CoffeeLoverApi());
    //Repository
    Get.lazyPut<ICoffeeRepository>(() => CoffeeRepository(api: Get.find<CoffeeLoverApi>()));
    //Use Cases
    Get.lazyPut<GetRandomCoffeeUseCase>(() => GetRandomCoffeeUseCase(coffeeRepository: Get.find<ICoffeeRepository>()));
  }
}
