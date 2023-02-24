import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/common/extensions/size_extensions.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/size_constants.dart';
import '../../../common/constants/string_constants.dart';
import '../../../common/styles.dart';
import '../../../common/utils.dart';
import '../../widgets/common_widgets.dart';
import '../movie_detail/movie_detail_arguments.dart';

class TicketsFinalScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const TicketsFinalScreen({
    Key? key,
    required this.movieDetailArguments,
  }) : super(key: key);

  @override
  State<TicketsFinalScreen> createState() => _TicketsFinalScreenState();
}

class _TicketsFinalScreenState extends State<TicketsFinalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.5,
        title: Column(
          children: [
            Text(
              widget.movieDetailArguments.title!,
              style: AppStyles.regularTextStyle(
                  color: AppColors.black,
                  fontSize: Sizes.dimen_16
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: Sizes.dimen_1.h,),

            Text(
              'March 5, 2021 | 12:30 Hall 1',
              style: AppStyles.regularTextStyle(
                color: AppColors.blue,
                fontSize: Sizes.dimen_14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
            color: AppColors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index1) {
            return Center(
              child: SizedBox(
                height: Sizes.dimen_20.h,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: Sizes.dimen_6.w,
                          vertical: Sizes.dimen_4.w,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.app_fill,
                              size: 20.0,
                              color: index % 3 == 0? AppColors.blue : index1 % 5 == 0? AppColors.gold : index1 % 6 == 0? AppColors.purpleLight2 : AppColors.textGrey,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            );
          }),

          SizedBox(height: Sizes.dimen_20.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.app_fill,
                    size: 20.0,
                    color: AppColors.gold,
                  ),

                  SizedBox(width: Sizes.dimen_4.w,),

                  Text(
                    'Selected',
                    style: AppStyles.regularTextStyle(
                      color: AppColors.textGrey,
                      fontSize: Sizes.dimen_14,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),

              SizedBox(width: Sizes.dimen_20.w,),

              Row(
                children: [
                  const Icon(
                    CupertinoIcons.app_fill,
                    size: 20.0,
                    color: AppColors.textGrey,
                  ),

                  SizedBox(width: Sizes.dimen_4.w,),

                  Text(
                    'Not Available',
                    style: AppStyles.regularTextStyle(
                      color: AppColors.textGrey,
                      fontSize: Sizes.dimen_14,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              )
            ],
          ),

          SizedBox(height: Sizes.dimen_16.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.app_fill,
                    size: 20.0,
                    color: AppColors.purpleLight2,
                  ),

                  SizedBox(width: Sizes.dimen_4.w,),

                  Text(
                    'VIP (\$150)',
                    style: AppStyles.regularTextStyle(
                      color: AppColors.textGrey,
                      fontSize: Sizes.dimen_14,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),

              SizedBox(width: Sizes.dimen_20.w,),

              Row(
                children: [
                  const Icon(
                    CupertinoIcons.app_fill,
                    size: 20.0,
                    color: AppColors.blue,
                  ),

                  SizedBox(width: Sizes.dimen_4.w,),

                  Text(
                    'Regular (\$50)',
                    style: AppStyles.regularTextStyle(
                      color: AppColors.textGrey,
                      fontSize: Sizes.dimen_14,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              )
            ],
          ),

          Container(
            margin: EdgeInsets.symmetric(
              horizontal: Sizes.dimen_16.w,
              vertical: Sizes.dimen_16.h,
            ),
            child: buttonFilled(
              text: AppStrings.proceed,
              onPressed: () {

              },
            ),
          ),
        ],
      ),
    );
  }
}
