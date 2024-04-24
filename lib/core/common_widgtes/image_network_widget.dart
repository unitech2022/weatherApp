import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageNetworkWidget extends StatelessWidget {
  final String image;
  final double? hieght, width;
  const ImageNetworkWidget({
    super.key,
 required this.image, this.hieght, this.width,
  });



  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:image,
      height:hieght?? 100.w,
      width:width?? 100.w,
      fit: BoxFit.cover,
    );
  }
}
