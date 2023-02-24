import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/common/extensions/size_extensions.dart';
import 'package:movieflix/presentation/widgets/widget_skeletons.dart';

import '../../common/constants/color_constants.dart';
import '../../common/constants/size_constants.dart';
import '../../common/styles.dart';

Widget extendedImage({required String path, required double width, required double height, IconData? placeHolder, double radius = 5.0, double? iconSize, Color? color}) {
  return ExtendedImage.network(
    path,
    width: width,
    height: height,
    fit: BoxFit.cover,
    cache: true,
    clearMemoryCacheIfFailed: true,
    clearMemoryCacheWhenDispose: true,
    timeLimit: const Duration(milliseconds: 100),
    retries: 5,
    color: color,
    timeRetry: const Duration(milliseconds: 100),
    borderRadius: BorderRadius.circular(radius),
    enableMemoryCache: true,
    mode: ExtendedImageMode.none,
    gaplessPlayback: true,
    enableLoadState: true,
    handleLoadingProgress: true,
    loadStateChanged: (ExtendedImageState state) {
      if (state.extendedImageLoadState == LoadState.loading) {
        return Container(width: 80.0, height: 80.0, child: skeletonBaseWidget(child: roundedSkeletonContainer()));
      } else if (state.extendedImageLoadState == LoadState.completed) {
        return null;
      } else if (state.extendedImageLoadState == LoadState.failed) {
        return InkWell(
            onTap: () {
              state.reLoadImage();
            },
            child: Container( height: 200.0, color: Colors.grey[400]!.withOpacity(0.3), child: Icon(placeHolder != null? placeHolder : Icons.image_outlined, color: Colors.white, size: iconSize,),));
      }
      return null;
    },
  );
}

Widget buttonFilled({required String text, required Function() onPressed}) {
  return Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(Sizes.dimen_10),
    child: InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(Sizes.dimen_10),
              ),
              padding: EdgeInsets.symmetric(
                vertical: Sizes.dimen_10.h,
              ),
              child: Center(
                child: Text(
                  text,
                  style: AppStyles.regularTextStyle(
                    color: AppColors.white,
                    fontSize: Sizes.dimen_14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buttonOutlined({required String text, required Function() onPressed}) {
  return Material(
    elevation: 5.0,
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(Sizes.dimen_10),
    child: InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.blue,
                  width: 1.5
                ),
                borderRadius: BorderRadius.circular(Sizes.dimen_10),
              ),
              padding: EdgeInsets.symmetric(
                vertical: Sizes.dimen_10.h,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.play_arrow,
                      color: AppColors.white,
                      size: Sizes.dimen_20,
                    ),

                    SizedBox(width: Sizes.dimen_6.w),

                    Text(
                      text,
                      style: AppStyles.regularTextStyle(
                        color: AppColors.white,
                        fontSize: Sizes.dimen_14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}