import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sott_examen/features/home/widgets/home_bottom_items.dart';
import 'package:sott_examen/features/home/widgets/home_grid_view.dart';
import '../managers/home_bloc.dart';
import '../managers/home_state.dart';
import '../widgets/sott_bottom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status == HomeStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == HomeStatus.error) {
          return const Center(child: Text("Xato!"));
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                toolbarHeight: 129.h,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/notification.svg"),
                  ),
                ],
                flexibleSpace: Image.asset(
                  "assets/images/background.png",
                  fit: BoxFit.cover,
                ),
                floating: true,
                snap: true,
                pinned: false,
                backgroundColor: Colors.white,
                title: Text(
                  'SOTT',
                  style: TextStyle(
                    color: Color(0xFF1A1528),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                leading: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: SvgPicture.asset("assets/icons/logo.svg"),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(48.h),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeBottomItems(
                          image: "assets/icons/key.svg",
                          title: "Purchase",
                        ),
                        HomeBottomItems(
                          image: "assets/icons/defend.svg",
                          title: "Sale",
                        ),
                        HomeBottomItems(
                          image: "assets/icons/clock.svg",
                          title: "Rent",
                        ),
                        HomeBottomItems(
                          image: "assets/icons/building.svg",
                          title: "Pass",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              HomeGridView(state: state),
            ],
          ),
          bottomNavigationBar: const SottBottomNavigationBar(),
        );
      },
    );
  }
}
