import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/styles/text_styles.dart';

class ErrorCallApiWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onTap;
  const ErrorCallApiWidget({super.key, required this.message,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/error.png",
            height: 150.h,
            width: 150.w,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 30.w,
          ),
          Text(message,
          textAlign: TextAlign.center,
          style: TextStyles.textStyleNotInternet,),
           SizedBox(
            height: 40.w,
          ),
          onTap != null
              ? ElevatedButton(
                
                  onPressed: onTap,
                  
                  child: const Text("Retry"),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
