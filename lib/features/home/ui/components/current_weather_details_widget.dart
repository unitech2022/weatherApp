import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/styles/container_styles.dart';
import '../../provider/home_provider.dart';

class CurrentWeatherDetailsWidget extends StatelessWidget {
  const CurrentWeatherDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(16),
                  decoration: ContainerStyles.elevationContainner,
                  child: Image.asset("assets/icons/windspeed.png"),
                ),
                Container(
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(16),
                  decoration: ContainerStyles.elevationContainner,
                  child: Image.asset("assets/icons/clouds.png"),
                ),
                Container(
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(16),
                  decoration: ContainerStyles.elevationContainner,
                  child: Image.asset("assets/icons/humidity.png"),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 20,
                  width: 60,
                  child: Text(
                    "${context.watch<HomeProvider>().weatherResponse!.current.windKph}km/h",
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 60,
                  child: Text(
                    "${context.watch<HomeProvider>().weatherResponse!.current.cloud}%",
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 60,
                  child: Text(
                    "${context.watch<HomeProvider>().weatherResponse!.current.humidity}%",
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )
         
      ],
    );
  }
}