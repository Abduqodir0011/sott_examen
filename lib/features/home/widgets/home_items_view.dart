import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeItemsView extends StatelessWidget {
  final String image;
  final String currency;
  final String category;
  final String icon;
  final String place;
  final int price;
  final int numOfRooms;
  final int floor;
  final int totalFloors;
  final num area;
  final int distance;

  const HomeItemsView({
    super.key,
    required this.image,
    required this.currency,
    required this.category,
    required this.icon,
    required this.place,
    required this.price,
    required this.numOfRooms,
    required this.floor,
    required this.totalFloors,
    required this.area,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 169.w,
      margin: EdgeInsets.only(bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              image,
              width: double.infinity,
              height: 128.h,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$price',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A1528),
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                currency,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A1528),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            "$category • ${numOfRooms}Rms • $floor/$totalFloors • ${area}м²",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF333333),
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              SvgPicture.network(
                icon,
                width: 13.w,
                height: 17.h,
              ),
              SizedBox(width: 5.w),
              Expanded(
                child: Text(
                  place,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                "${distance}m",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
