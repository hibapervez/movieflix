import 'package:flutter/material.dart';
import 'package:movieflix/common/extensions/size_extensions.dart';
import 'package:movieflix/presentation/screens/watch/movie_list_tile.dart';

import '../../common/constants/size_constants.dart';
import 'Skeleton.dart';

Widget skeletonBaseWidget({required Widget child}) {
  return Skeleton();
}

Widget roundedSkeletonContainer({double height = 10.0}) {
  return Container(
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(3.0),
      color: Colors.grey,
    ),
  );
}

Widget skeletonMovieTile () {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
    child: ListView(
      children: [
        Container(
          height: Sizes.dimen_120.h,
          margin: EdgeInsets.only(bottom: Sizes.dimen_6.h),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(Sizes.dimen_16.w),
            ),
            elevation: 4,
            child: Container(width: Sizes.dimen_100.w, height: Sizes.dimen_120.h, child: skeletonBaseWidget(child: roundedSkeletonContainer())),
          ),
        ),
        Container(
          height: Sizes.dimen_120.h,
          margin: EdgeInsets.only(bottom: Sizes.dimen_6.h),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(Sizes.dimen_16.w),
            ),
            elevation: 4,
            child: Container(width: Sizes.dimen_100.w, height: Sizes.dimen_120.h, child: skeletonBaseWidget(child: roundedSkeletonContainer())),
          ),
        ),
        Container(
          height: Sizes.dimen_120.h,
          margin: EdgeInsets.only(bottom: Sizes.dimen_6.h),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(Sizes.dimen_16.w),
            ),
            elevation: 4,
            child: Container(width: Sizes.dimen_100.w, height: Sizes.dimen_120.h, child: skeletonBaseWidget(child: roundedSkeletonContainer())),
          ),
        ),
      ],
    ),
  );
}