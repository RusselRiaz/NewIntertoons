import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ImageShimmer extends StatelessWidget {
  double height,width;
  ImageShimmer({Key? key,required this.height,required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.white,
      enabled: true,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    );

  }
}
