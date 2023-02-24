import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movieflix/common/extensions/size_extensions.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/image_constants.dart';
import '../../../common/constants/size_constants.dart';
import '../../../common/styles.dart';

class CinemaHallTile extends StatelessWidget {
  const CinemaHallTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '12:30',
              style: AppStyles.semiBoldTextStyle(
                  color: AppColors.black,
                  fontSize: Sizes.dimen_14
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(width: Sizes.dimen_6.w,),

            Text(
              'Cinetech + Hall 1',
              style: AppStyles.regularTextStyle(
                  color: AppColors.textGrey,
                  fontSize: Sizes.dimen_14
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),

        SizedBox(height: Sizes.dimen_10.h,),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.dimen_12.w),
            border: Border.all(
              color: AppColors.blue,
              width: Sizes.dimen_1.w,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_26.w, vertical: Sizes.dimen_20.w),
          margin: EdgeInsets.only(right: Sizes.dimen_12.w, bottom: Sizes.dimen_6.w),
          child: SvgPicture.asset(AppImages.hall, width: Sizes.dimen_180.w,),
        ),

        SizedBox(height: Sizes.dimen_10.h,),

        Row(
          children: [
            Text(
              'From ',
              style: AppStyles.regularTextStyle(
                  color: AppColors.textGrey,
                  fontSize: Sizes.dimen_14
              ),
              textAlign: TextAlign.center,
            ),

            Text(
              '\$50',
              style: AppStyles.semiBoldTextStyle(
                  color: AppColors.black,
                  fontSize: Sizes.dimen_14
              ),
              textAlign: TextAlign.center,
            ),

            Text(
              ' or ',
              style: AppStyles.regularTextStyle(
                  color: AppColors.textGrey,
                  fontSize: Sizes.dimen_14
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(width: Sizes.dimen_6.w,),

            Text(
              '2500 Bonus',
              style: AppStyles.semiBoldTextStyle(
                  color: AppColors.black,
                  fontSize: Sizes.dimen_14
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
