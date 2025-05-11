import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sott_examen/features/home/widgets/home_bottom_items.dart';
import 'package:sott_examen/features/home/widgets/home_grid_view.dart';
import '../managers/home_bloc.dart';
import '../managers/home_state.dart';
import '../widgets/sott_bottom_navigation_bar.dart';
import '../widgets/sott_icons_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status == HomeStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status == HomeStatus.error) {
          return const Center(child: Text("Xato!"));
        }
        if (state.status == HomeStatus.success) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset("assets/logo.svg", width: 36.w, height: 36.h),
                      ],
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "SOTT",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/notifications.svg", width: 28.w, height: 28.h),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60.h),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SottIconsButton(icon: "assets/icons/key.svg", title: "", width: 40, height: 40, callback: () {}),
                      SottIconsButton(icon: "assets/icons/defend.svg", title: "", width: 40, height: 40, callback: () {}),
                      SottIconsButton(icon: "assets/icons/clock.svg", title: "", width: 40, height: 40, callback: () {}),
                      SottIconsButton(icon: "assets/icons/building.svg", title: "", width: 40, height: 40, callback: () {}),
                    ],
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      HomeBottomItems(image: "assets/icons/key.svg", title: "Purchase"),
                      HomeBottomItems(image: "assets/icons/defend.svg", title: "Sale"),
                      HomeBottomItems(image: "assets/icons/clock.svg", title: "Rent"),
                      HomeBottomItems(image: "assets/icons/building.svg", title: "Pass"),
                    ],
                  ),
                ),
                Expanded(
                  child: HomeGridView(state: state),
                ),
              ],
            ),
            bottomNavigationBar: const SottBottomNavigationBar(),
          );
        }
        return const Center(child: Text("False"));
      },
    );
  }
}