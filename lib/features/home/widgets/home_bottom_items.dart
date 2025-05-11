import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBottomItems extends StatelessWidget {
  final String image;
  final String title;

  const HomeBottomItems({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 78.5.w,
      child: Column(
        children: [
          Container(
            height: 78.5.h,
            width: 78.5.w,
            decoration: BoxDecoration(
              color: const Color(0xFFFFCE48),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: SvgPicture.asset(
                image,
                width: 30.w,
                height: 30.h,
              ),
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF1A1528),
            ),
          ),
        ],
      ),
    );
  }
}