import 'package:cofee_lover/data/models/random_coffee_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'coffee_lover_api.g.dart';

@RestApi(baseUrl: 'https://coffee.alexflipnote.dev')
abstract class CoffeeLoverApi {
  factory CoffeeLoverApi() {
    final dio = Dio();
    dio.interceptors.addAll([
      PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: false,
        request: true,
        error: true,
        compact: true,
        maxWidth: 150,
      ),
    ]);
    dio.options = BaseOptions(
      receiveTimeout: const Duration(seconds: kDebugMode ? 60 : 10),
      connectTimeout: const Duration(seconds: kDebugMode ? 60 : 10),
    );
    return _CoffeeLoverApi(dio);
  }

  @GET('/random.json')
  Future<RandomCoffeeResponse> getRandomCoffee();
}
