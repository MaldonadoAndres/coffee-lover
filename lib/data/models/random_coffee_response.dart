import 'package:json_annotation/json_annotation.dart';

part 'random_coffee_response.g.dart';

@JsonSerializable()
class RandomCoffeeResponse {
  final String file;

  RandomCoffeeResponse({required this.file});
  factory RandomCoffeeResponse.fromJson(Map<String, dynamic> json) => _$RandomCoffeeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RandomCoffeeResponseToJson(this);
}
