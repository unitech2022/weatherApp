import 'package:dio/dio.dart';
import 'package:weather_app/core/network/api_result.dart';
import 'package:weather_app/core/network/dio_factory.dart';
import 'package:weather_app/core/network/error_message_model.dart';
import 'package:weather_app/core/utlis/api_constatns.dart';

import 'package:weather_app/features/home/data/models/weather_response.dart';

abstract class BaseHome {
  Future<ApiResult<WeatherResponse>> getCurrentWeather({quary});
}

class HomeRepo implements BaseHome {
  @override
  Future<ApiResult<WeatherResponse>> getCurrentWeather({quary}) async {
    try {
      var response = await DioFactory.dio!.request(
        '${ApiConstants.currentWeatherDataPath}key=${ApiConstants.apiKey}&q=$quary',
        options: Options(
          method: 'GET',
        ),
      );
      return ApiResult.success(WeatherResponse.fromJson(response.data));
    } on DioException catch (e) {
      return ApiResult.failure(ErrorMessageResponse.fromJson(e.response!.data));
    }


  }
}
