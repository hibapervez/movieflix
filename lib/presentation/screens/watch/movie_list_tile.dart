import 'package:flutter/material.dart';
import 'package:movieflix/common/extensions/size_extensions.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/size_constants.dart';
import '../../../common/styles.dart';
import '../../../data/core/api_constants.dart';
import '../../../data/models/movie_model.dart';
import '../../widgets/common_widgets.dart';

class MovieListTile extends StatelessWidget {
  final Function onTap;
  final MovieModel movie;

  const MovieListTile({
    Key? key,
    required this.onTap,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_120.h,
      margin: EdgeInsets.only(bottom: Sizes.dimen_6.h),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
        ),
        elevation: 4,
        child: GestureDetector(
          onTap: () => onTap(),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
                child: Hero(
                  tag: '${movie.id}',
                  child: extendedImage(
                    path:
                    '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                    width: Sizes.dimen_100.w,
                    height: Sizes.dimen_120.h,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(
                    Sizes.dimen_20.h,
                    Sizes.dimen_20.h,
                    Sizes.dimen_20.h,
                    Sizes.dimen_10.h),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_16.w)),
                  gradient: LinearGradient(
                      colors: [
                        Colors.black54,
                        Colors.black26.withOpacity(0.1),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: const [
                        0.0,
                        0.9,
                      ],
                      tileMode: TileMode.clamp),
                ),
                child: Text(
                  movie.title,
                  style: AppStyles.regularTextStyle(
                      fontSize: 20.0,
                      color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
