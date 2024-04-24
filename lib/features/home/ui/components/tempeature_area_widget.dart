import 'package:flutter/material.dart';
import 'package:weather_app/core/extensions/global_extensions.dart';
import 'package:weather_app/features/home/data/models/weather_model.dart';
import '../../../../core/common_widgtes/image_network_widget.dart';
import '../../../../core/styles/colors_app.dart';
import '../../../../core/styles/text_styles.dart';

class TempeatureAreaWidget extends StatelessWidget {
  final WeatherModel weather;
  const TempeatureAreaWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ImageNetworkWidget(image:  context.getIconWeather(weather.condition.icon)),
        Container(
          height: 50,
          width: 1,
          color: ColorsApp.mainColor,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "${weather.tempC.toInt()}°",
                style: TextStyles.textStyle68FontMainColor),
            TextSpan(
                text: weather.condition.text,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey,
                )),
          ]),
        )
      ],
    );
  }
}

