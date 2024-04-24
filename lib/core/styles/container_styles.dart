import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ContainerStyles {
  static BoxDecoration durationGGradientBlue = BoxDecoration(
      borderRadius: BorderRadius.circular(15.r),
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          const Color(0xff2072E0),
          const Color(0xff2072E0).withOpacity(.8),
          const Color(0xff2072E0).withOpacity(.6),
          const Color(0xff2072E0).withOpacity(.4),
        ],
      ));

  static BoxDecoration elevationContainner = BoxDecoration(
    borderRadius: BorderRadius.circular(7.0.r),
    color: const Color(0xffffffff),
    boxShadow: const [
      BoxShadow(
        color: Color(0x29000000),
        offset: Offset(0, 1),
        blurRadius: 13,
      ),
    ],
  );

  static BoxDecoration elevationImageContainner = BoxDecoration(
    borderRadius: BorderRadius.circular(7.0),
    image: const DecorationImage(
      image: AssetImage(''),
      fit: BoxFit.cover,
    ),
    boxShadow: const [
      BoxShadow(
        color: Color(0x29000000),
        offset: Offset(0, 3),
        blurRadius: 2,
      ),
    ],
  );


  static BoxDecoration decorationMap(
    double radius, {
    color,
  }) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29b6b6b6),
            offset: Offset(0, 0),
            blurRadius: 10,
          ),
        ],
      );



}
