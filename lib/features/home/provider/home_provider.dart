import 'package:cofee_lover/domain/use_cases/get_random_coffee_use_case.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_provider.g.dart';

const String kListKey = 'list_key';
@riverpod
Future<String> getRandomCoffee(GetRandomCoffeeRef ref) async {
  final getRandomCoffeeUseCase = Get.find<GetRandomCoffeeUseCase>();
  return getRandomCoffeeUseCase();
}

@Riverpod(keepAlive: true)
class SaveToLocal extends _$SaveToLocal {
  @override
  FutureOr<void> build() => null;

  void save(String imageUrl) async {
    state = const AsyncValue.loading();
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final list = sharedPreferences.getStringList(kListKey) ?? [];
    list.add(imageUrl);
    sharedPreferences.setStringList(kListKey, list).then(
          (_) => state = const AsyncValue.data(null),
        );
  }
}
