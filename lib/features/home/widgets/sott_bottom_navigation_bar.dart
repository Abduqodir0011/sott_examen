import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sott_examen/features/home/widgets/sott_icons_button.dart';

class SottBottomNavigationBar extends StatelessWidget {
  const SottBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 9.h),
      width: double.infinity,
      height: 84.h,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFDADADA).withOpacity(0.3),
            offset: const Offset(0, -12),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SottIconsButton(icon: "assets/icons/home.svg", title: "Home", width: 23.33.w, height: 23.33.h, callback: () {},
          ),
          SottIconsButton(icon: "assets/icons/search.svg", title: "Home", width: 23.33.w, height: 23.33.h, callback: () {},
          ),
          SottIconsButton(icon: "assets/icons/home_with_plus.svg", title: "Home", width: 23.33.w, height: 23.33.h, callback: () {},
          ),
          SottIconsButton(icon: "assets/icons/chat.svg", title: "Home", width: 23.33.w, height: 23.33.h, callback: () {},
          ),
          SottIconsButton(icon: "assets/icons/profile.svg", title: "Home", width: 23.33.w, height: 23.33.h, callback: () {},
          ),
        ],
      ),
    );
  }
}