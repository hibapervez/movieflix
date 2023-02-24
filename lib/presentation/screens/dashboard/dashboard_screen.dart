import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieflix/common/constants/color_constants.dart';
import 'package:movieflix/common/constants/string_constants.dart';
import 'package:movieflix/presentation/cubits/movies/upcoming_movies_cubit.dart';
import 'package:movieflix/presentation/screens/media_lib/media_lib_screen.dart';
import 'package:movieflix/presentation/screens/more/more_screen.dart';

import '../../../common/constants/image_constants.dart';
import '../../../common/styles.dart';
import '../../../di/get_it.dart';
import '../../cubits/navigation/navigation_cubit.dart';
import '../dashboard_home/dashboard_home_screen.dart';
import '../watch/watch_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _pageController = PageController();

  final pages = [
    const DashboardHomeScreen(),
    const WatchScreen(),
    const MediaLibScreen(),
    const MoreScreen(),
  ];

  List<String> bottomBarIcons = [
    AppImages.icDashboard,
    AppImages.icWatch,
    AppImages.icMediaLib,
    AppImages.icMore
  ];

  List<String> bottomBarTitles = [
  AppStrings.dashboard,
  AppStrings.watch,
  AppStrings.mediaLib,
  AppStrings.more,
  ];

  late UpcomingMoviesCubit movieTabbedCubit;
  late NavigationCubit navigationCubit;

  @override
  void initState() {
    super.initState();
    movieTabbedCubit = getItInstance<UpcomingMoviesCubit>();
    navigationCubit = getItInstance<NavigationCubit>();
  }

  @override
  void dispose() {
    movieTabbedCubit.close();
    navigationCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => navigationCubit,
        ),
        BlocProvider(
          create: (context) => movieTabbedCubit,
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<NavigationCubit, int>(
          builder: (context, state) {
            return PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: pages,
              onPageChanged: (index) {
                BlocProvider.of<NavigationCubit>(context).selectTab(index);
              },
            );
          }
        ),
        bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
          builder: (context, state) {
            return AnimatedBottomNavigationBar.builder(
              tabBuilder: (int index, bool isActive) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 5.0),

                    SvgPicture.asset(
                      bottomBarIcons[index],
                      width: 20.0,
                      height: 20,
                      colorFilter: ColorFilter.mode(state == index? AppColors.white : AppColors.purpleLight, BlendMode.srcIn)
                    ),

                    const SizedBox(height: 4.0,),

                    Text(
                      bottomBarTitles[index],
                      style: AppStyles.semiBoldTextStyle(fontSize: 12.0, color: state == index? AppColors.white : AppColors.purpleLight),
                    )
                  ],
                );
              },
              itemCount: pages.length,
              activeIndex: state,
              splashRadius: 15.0,
              backgroundColor: AppColors.purple,
              splashSpeedInMilliseconds: 400,
              notchSmoothness: NotchSmoothness.defaultEdge,
              gapLocation: GapLocation.none,
              leftCornerRadius: 20.0,
              rightCornerRadius: 20.0,
              elevation: 5.0,
              onTap: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
                BlocProvider.of<NavigationCubit>(context).selectTab(index);
              },
            );
          },
        ),
      ),
    );
  }
}
