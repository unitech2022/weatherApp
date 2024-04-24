import 'package:flutter/material.dart';

extension GlobalExtensions on BuildContext {


    // Returns the image URL based on the provided iconWeather string.
  String getIconWeather(String iconWeather) {
    String image = iconWeather.split("//")[1];
    return "https://$image";
  }
}
