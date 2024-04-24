import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/extensions/global_extensions.dart';
import 'package:weather_app/features/forecast/data/models/forcast_response.dart';

import '../../../../core/common_widgtes/image_network_widget.dart';
import '../../../../core/styles/text_styles.dart';
import '../../data/models/forcast_model.dart';

class DailyDataForcast extends StatelessWidget {
  final ForcastResponse forcastResponse;
  const DailyDataForcast({super.key, required this.forcastResponse});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20).w,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Next Days",
                style: TextStyles.textStyle17BoldBlackColor,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          //*
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: forcastResponse.forecast.forecastday.length,
            itemBuilder: (context, index) {
              ForcastModel forcastModel =
                  forcastResponse.forecast.forecastday[index];
              return Column(
                children: [
                  SizedBox(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 80,
                            child: Text(
                              getDay(forcastModel.dateEpoch),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ImageNetworkWidget(
                                  image: context.getIconWeather(
                                      forcastModel.day.condition.icon)),
                              Text(
                                forcastModel.day.condition.text,
                           
                              )
                            ],
                          ),
                          Text(
                              "${forcastModel.day.maxtempC}°/${forcastModel.day.mintempC}")
                        ],
                      )),
                  Container(
                    height: 1,
                    color: Colors.grey,
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  /// * format date
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }
}
