import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_items_view.dart';
import '../managers/home_state.dart';

class HomeGridView extends StatelessWidget {
  final HomeState state;

  const HomeGridView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 20.h,
          childAspectRatio: 0.75,
        ),
        itemCount: state.products.length,
        itemBuilder: (context, index) {
          final p = state.products[index];
          return HomeItemsView(
            image: p.image,
            currency: p.currency,
            category: p.category,
            icon: p.nearestPopularPlace.image,
            place: p.nearestPopularPlace.title,
            price: p.price,
            numOfRooms: p.numOfRooms,
            floor: p.floor,
            totalFloors: p.totalFloors,
            area: p.area,
            distance: p.nearestPopularPlace.distance,
          );
        },
      ),
    );
  }
}
