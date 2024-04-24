import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/forecast/data/repo/forcast_repo.dart';
import 'package:weather_app/features/forecast/provider/forcast_provider.dart';
import 'package:weather_app/features/home/data/repo/home_repo.dart';
import 'package:weather_app/features/home/provider/home_provider.dart';

import '../network/dio_factory.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    Dio dio = await DioFactory.getDio();

    sl.registerLazySingleton<Dio>(() => dio);

    ///* repo
    sl.registerLazySingleton<BaseHome>(() => HomeRepo());
    sl.registerLazySingleton<BaseForcast>(() => ForcastRepo());

    ///* providers
    sl.registerFactory<HomeProvider>(() => HomeProvider(sl()));
    sl.registerFactory<ForcastProvider>(() => ForcastProvider(sl()));
  }
}
