import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.dimension = 16, this.color});

  final double dimension;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension.r,
      child: CircularProgressIndicator(strokeWidth: 2.w, color: color),
    );
  }
}
