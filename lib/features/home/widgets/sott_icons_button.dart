import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SottIconsButton extends StatelessWidget {
  const SottIconsButton({
    super.key,
    required this.icon,
    required this.title,
    required this.width,
    required this.height,
    required this.callback,
  });

  final String icon, title;
  final double width, height;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: callback,
          icon: SvgPicture.asset(icon, width: width.w, height: height.h, fit: BoxFit.cover,
          ),
        ),
        if (title.isNotEmpty)
          Text(title, style: TextStyle(
              color: const Color(0xFF1A1528),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}