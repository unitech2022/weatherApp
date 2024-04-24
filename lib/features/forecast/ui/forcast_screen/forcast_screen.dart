import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/styles/colors_app.dart';
import 'package:weather_app/core/styles/text_styles.dart';
import 'package:weather_app/features/forecast/provider/forcast_provider.dart';
import 'package:weather_app/features/forecast/ui/components/daily_data_forcast.dart';
import 'package:weather_app/features/home/data/models/weather_response.dart';
import '../../../../core/common_widgtes/error_call_api_widget.dart';
import '../../../../core/common_widgtes/loading_widget.dart';
import '../../../../core/enums/loading_status.dart';
import '../../../home/ui/components/current_weather_widget.dart';

class ForcastScreen extends StatefulWidget {
  final String quary;
  const ForcastScreen({super.key, required this.quary});

  @override
  State<ForcastScreen> createState() => _ForcastScreenState();
}

class _ForcastScreenState extends State<ForcastScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ForcastProvider>().getForcastWeather(quary: widget.quary);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Forcastes",
            style: TextStyles.textStyleAppBar,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const BackButton(
            color: ColorsApp.mainColor,
          ),
        ),
        body: getBodyForcast());
  }

  Widget getBodyForcast() {
    switch (context.watch<ForcastProvider>().getForcastState) {
      case RequestState.loading:
        return const LoadingWidget();
      case RequestState.loaded:
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              CurrentWeatherWidget(
                weatherResponse: WeatherResponse(
                    location: context
                        .watch<ForcastProvider>()
                        .forcastResponse!
                        .location,
                    current: context
                        .watch<ForcastProvider>()
                        .forcastResponse!
                        .current),
              ),

              /// * forcast weather
              DailyDataForcast(
                forcastResponse:
                    context.watch<ForcastProvider>().forcastResponse!,
              )
            ],
          ),
        );
      case RequestState.error:
        return ErrorCallApiWidget(
          message:
              context.watch<ForcastProvider>().getWeatherError!.error.message,
        );

      case RequestState.noInternet:
        return ErrorCallApiWidget(
          message: "Internet connection failed",
          onTap: () {
            context
                .read<ForcastProvider>()
                .getForcastWeather(quary: widget.quary);
          },
        );
    }
  }
}
