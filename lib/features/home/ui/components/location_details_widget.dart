import 'package:flutter/material.dart';
import 'package:weather_app/core/styles/text_styles.dart';
import 'package:weather_app/features/home/data/models/location_model.dart';



class LocationDetailsWidget extends StatelessWidget {
  final LocationModel location;
  const LocationDetailsWidget({
    super.key, required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
        TextSpan(
            text:
                "${location.name},",
            style: TextStyles.textStyleFontBold25MainColor),
        TextSpan(
            text:
                "${location.region},",
            style: TextStyles.textStyleFontBold25MainColor),
        TextSpan(
            text:
                location.country,
            style: TextStyles.textStyleFontBold25MainColor),
      ]),
    );
  }
}
