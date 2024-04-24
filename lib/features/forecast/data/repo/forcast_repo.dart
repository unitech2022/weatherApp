import 'package:dio/dio.dart';
import 'package:weather_app/core/network/api_result.dart';
import 'package:weather_app/core/network/dio_factory.dart';
import 'package:weather_app/core/network/error_message_model.dart';
import 'package:weather_app/core/utlis/api_constatns.dart';
import 'package:weather_app/features/forecast/data/models/forcast_response.dart';

abstract class BaseForcast {
  Future<ApiResult<ForcastResponse>> getForcast({quary});
}

class ForcastRepo implements BaseForcast {
  @override
  Future<ApiResult<ForcastResponse>> getForcast({quary}) async {
    try {
      var response = await DioFactory.dio!.request(
        '${ApiConstants.forecastPath}key=${ApiConstants.apiKey}&q=$quary&days=5',
        options: Options(
          method: 'GET',
        ),
      );
      return ApiResult.success(ForcastResponse.fromJson(response.data));
    } on DioException catch (e) {
      return ApiResult.failure(ErrorMessageResponse.fromJson(e.response!.data));
    }
  }
}
