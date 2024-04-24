import 'package:flutter/material.dart';
import 'package:weather_app/core/enums/loading_status.dart';
import 'package:weather_app/core/helpers/functions_helper.dart';
import 'package:weather_app/core/network/error_message_model.dart';
import 'package:weather_app/features/forecast/data/models/forcast_response.dart';
import 'package:weather_app/features/forecast/data/repo/forcast_repo.dart';

class ForcastProvider with ChangeNotifier {

  final BaseForcast _homeRepo;
  ForcastProvider(this._homeRepo);

  ForcastResponse? forcastResponse;
  ErrorMessageResponse? getWeatherError;
  RequestState getForcastState = RequestState.loading;

  /// *  call get forcast  api
  Future<void> getForcastWeather({quary}) async {
    /// * check internet connection
    bool hasInternetResult = await FunnctionsHelper.hasInternet();

    if (hasInternetResult) {
      var result = await _homeRepo.getForcast(quary: quary);
      result.when(success: (message) {
        forcastResponse = message;
        getForcastState = RequestState.loaded;
        notifyListeners();
      }, failure: (error) {
        getForcastState = RequestState.error;
        getWeatherError = error;
        notifyListeners();
      });
    } else {
      getForcastState = RequestState.noInternet;
      notifyListeners();
    }
  }
}
