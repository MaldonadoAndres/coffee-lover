import 'package:cofee_lover/core/exceptions/custom_exception.dart';
import 'package:cofee_lover/features/home/provider/home_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorite_coffee_provider.g.dart';

@riverpod
Future<List<String>> getFavoriteCoffees(GetFavoriteCoffeesRef ref) async {
  try {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(kListKey) ?? [];
  } catch (e) {
    throw CustomException('Failed to get favorite coffees.Please try again.');
  }
}
