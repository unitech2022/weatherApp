import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/icons/clouds.png",
          height: 200,
          width: 200,
        ),
        const CircularProgressIndicator()
      ],
    ));
  }
}