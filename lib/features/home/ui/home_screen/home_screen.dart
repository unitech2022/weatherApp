import 'package:flutter/material.dart';
import 'package:weather_app/core/common_widgtes/error_call_api_widget.dart';
import 'package:weather_app/core/extensions/extensions_routing.dart';
import 'package:weather_app/features/home/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/home/ui/components/current_weather_widget.dart';
import '../../../../core/common_widgtes/loading_widget.dart';
import '../../../../core/enums/loading_status.dart';
import '../../../../core/utlis/utils.dart';
import '../../../forecast/ui/forcast_screen/forcast_screen.dart';
import '../components/home_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<HomeProvider>()
        .getCurrentWeather(quary: "${locData.latitude},${locData.longitude}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          title:

              /// search widget
              HomeSearchBar(
            enable: true,
            onChange: (value) {
              context.read<HomeProvider>().getCurrentWeather(quary: value);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (Provider.of<HomeProvider>(context, listen: false)
                    .weatherResponse !=
                null) {
              context.navigatePush(ForcastScreen(
                  quary: Provider.of<HomeProvider>(context, listen: false)
                      .weatherResponse!
                      .location
                      .name));
            } else {
              context.navigatePush(ForcastScreen(
                  quary: "${locData.latitude},${locData.longitude}"));
            }
          },
          child: const Icon(Icons.location_searching),
        ),
        body: SafeArea(child: getBodyHome()));
  }

  Widget getBodyHome() {
    switch (context.watch<HomeProvider>().getCurrenWeatherState) {
      case RequestState.loading:
        return const LoadingWidget();
      case RequestState.loaded:
        return Column(
          children: [
            const Spacer(),
            /// * current weather
            CurrentWeatherWidget(
              weatherResponse: context.watch<HomeProvider>().weatherResponse!,
            ),
            const Spacer(),
          ],
        );
      case RequestState.error:
        return ErrorCallApiWidget(
          message: context.watch<HomeProvider>().getWeatherError!.error.message,
        );

      case RequestState.noInternet:
        return ErrorCallApiWidget(
          message: "Internet connection failed",
          onTap: () {
            context.read<HomeProvider>().getCurrentWeather(
                quary: "${locData.latitude},${locData.longitude}");
          },
        );
    }
  }
}


