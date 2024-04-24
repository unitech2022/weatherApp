import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather_app/core/styles/colors_app.dart';

import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle textStyleFontBold25MainColor = TextStyle(
    color: ColorsApp.mainColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    height: 0,
  );

  static TextStyle textStyle17BoldBlackColor = TextStyle(
    color: Colors.black,
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
    height: 0,
  );



  static TextStyle textStyleAppBar = TextStyle(
    color: ColorsApp.mainColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    height: 0,
  );

  static TextStyle textStyle68FontMainColor =  TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 68.sp,
    color: ColorsApp.mainColor,
  );

  static TextStyle textStyleAlphapitText = TextStyle(
    color: ColorsApp.mainColor,
    fontSize: 13.sp,
    fontWeight: FontWeight.bold,
    height: 0,
  );

  static TextStyle textStyleFieldText = TextStyle(
    color: ColorsApp.mainColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    height: 0,
  );
  static TextStyle textStyleFieldHint = TextStyle(
    color: Colors.grey,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.light,
    height: 0,
  );

  static TextStyle textStyleNotInternet = TextStyle(
    color: Colors.red,
    fontSize: 25.sp,
    fontWeight: FontWeightHelper.bold,
    height: 0,
  );
}
