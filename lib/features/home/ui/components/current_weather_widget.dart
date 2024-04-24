import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/home/data/models/weather_response.dart';
import 'package:weather_app/features/home/ui/components/tempeature_area_widget.dart';
import 'current_weather_details_widget.dart';
import 'location_details_widget.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherResponse weatherResponse;
  const CurrentWeatherWidget({super.key, required this.weatherResponse,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        

        /// * name City and country
         LocationDetailsWidget(location: weatherResponse.location,),
        SizedBox(
          height: 40.h,
        ),
         TempeatureAreaWidget(weather: weatherResponse.current,),
        SizedBox(
          height: 60.h,
        ),

        /// * wind amd clouds and  humdity
        const CurrentWeatherDetailsWidget()
      ],
    );
  }
}
