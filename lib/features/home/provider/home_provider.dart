import 'package:flutter/material.dart';
import 'package:weather_app/core/enums/loading_status.dart';
import 'package:weather_app/core/helpers/functions_helper.dart';
import 'package:weather_app/core/network/error_message_model.dart';
import 'package:weather_app/features/home/data/models/weather_response.dart';
import 'package:weather_app/features/home/data/repo/home_repo.dart';

class HomeProvider with ChangeNotifier {
  final BaseHome _homeRepo;
  HomeProvider(this._homeRepo);



  WeatherResponse? weatherResponse;
  ErrorMessageResponse? getWeatherError;
  RequestState getCurrenWeatherState = RequestState.loading;

  /// *  call get current weather api
  Future<void> getCurrentWeather({quary}) async {
    /// * check internet connection
    bool hasInternetResult = await FunnctionsHelper.hasInternet();

    if (hasInternetResult) {
      var result = await _homeRepo.getCurrentWeather(quary: quary);
      result.when(success: (message) {
        weatherResponse = message;
        getCurrenWeatherState = RequestState.loaded;
        notifyListeners();
      }, failure: (error) {
        getCurrenWeatherState = RequestState.error;
        getWeatherError = error;
        notifyListeners();
      });
    } else {
      getCurrenWeatherState = RequestState.noInternet;
      notifyListeners();
    }
  }
}
