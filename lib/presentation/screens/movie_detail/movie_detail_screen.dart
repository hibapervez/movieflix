import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/common/constants/string_constants.dart';
import 'package:movieflix/common/extensions/size_extensions.dart';
import 'package:movieflix/common/styles.dart';
import 'package:movieflix/presentation/widgets/button.dart';
import 'package:movieflix/presentation/widgets/common_widgets.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/route_constants.dart';
import '../../../common/constants/size_constants.dart';
import '../../../common/utils.dart';
import '../../../data/core/api_constants.dart';
import '../../../data/models/movie_detail_model.dart';
import '../../../di/get_it.dart';
import '../../cubits/movie_detail/movie_detail_cubit.dart';
import '../loading/loading_circle.dart';
import 'movie_detail_arguments.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({
    Key? key,
    required this.movieDetailArguments,
  }) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailCubit _movieDetailCubit;

  @override
  void initState() {
    super.initState();
    _movieDetailCubit = getItInstance<MovieDetailCubit>();
    _movieDetailCubit.loadMovieDetail(widget.movieDetailArguments.movieId);
  }

  @override
  void dispose() {
    _movieDetailCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailCubit),
        ],
        child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              return FadeIn(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: Sizes.dimen_300.h,
                            child: Stack(
                              fit: StackFit.expand,
                              // alignment: Alignment.bottomCenter,
                              children: [
                                Hero(
                                  tag: '${movieDetail.id}',
                                  child: extendedImage(
                                    path: '${ApiConstants.BASE_IMAGE_URL}${movieDetail.posterPath}' ?? '',
                                    width: Sizes.dimen_100.w,
                                    height: Sizes.dimen_300.h
                                  ),
                                ),

                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                      Sizes.dimen_20.h,
                                      Sizes.dimen_20.h,
                                      Sizes.dimen_20.h,
                                      Sizes.dimen_10.h),
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0),
                                    ),
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.black87,
                                          Colors.black26.withOpacity(0.0),
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        stops: const [
                                          0.0,
                                          1.0,
                                        ],
                                        tileMode: TileMode.clamp),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          movieDetail.title,
                                          style: AppStyles.regularTextStyle(
                                            color: AppColors.gold,
                                            fontSize: Sizes.dimen_26
                                          ),
                                          textAlign: TextAlign.center,
                                        ),

                                        SizedBox(height: Sizes.dimen_8.h),

                                        Text(
                                          'In Theaters ${Utils.formatDate(movieDetail.releaseDate ?? '')}',
                                          style: AppStyles.regularTextStyle(
                                            color: AppColors.white,
                                            fontSize: Sizes.dimen_18,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),

                                        SizedBox(height: Sizes.dimen_8.h),

                                        buttonFilled(
                                          text: AppStrings.getTickets,
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                              RouteList.getTickets,
                                              arguments:
                                              MovieDetailArguments(
                                                movieDetail.id,
                                                movieDetail.posterPath,
                                                title: movieDetail.title,
                                                releaseDate: movieDetail.releaseDate,
                                              ),
                                            );
                                          },
                                        ),

                                        SizedBox(height: Sizes.dimen_8.h),

                                        buttonOutlined(
                                          text: AppStrings.watchTrailer,
                                          onPressed: () {},
                                        ),

                                        SizedBox(height: Sizes.dimen_8.h),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizes.dimen_20.w,
                              vertical: Sizes.dimen_10.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.genres,
                                  style: AppStyles.semiBoldTextStyle(
                                    color: AppColors.black,
                                    fontSize: Sizes.dimen_16,
                                  ),
                                ),

                                SizedBox(height: Sizes.dimen_4.h),

                                movieDetail.genres!.isNotEmpty? Padding(
                                  padding: const EdgeInsets.only(left: 10.0, bottom: 8.0, top: 6.0, right: 10.0),
                                  child: Wrap(
                                    spacing: 6.0,
                                    runSpacing: 5,
                                    children: <Widget>[...generateChips(movieDetail.genres!)],
                                  ),
                                ) : Container(),

                                SizedBox(height: Sizes.dimen_4.h),

                                const Divider(),

                                SizedBox(height: Sizes.dimen_4.h),

                                Text(
                                  AppStrings.overview,
                                  style: AppStyles.semiBoldTextStyle(
                                    color: AppColors.black,
                                    fontSize: Sizes.dimen_16,
                                  ),
                                ),

                                SizedBox(height: Sizes.dimen_4.h),

                                Text(
                                  movieDetail.overview ?? '',
                                  style: AppStyles.regularTextStyle(
                                    color: AppColors.textGrey,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: Sizes.dimen_8.h),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(CupertinoIcons.back, color: AppColors.white,)
                      ),
                    )
                  ],
                ),
              );
            } else if (state is MovieDetailError) {
              return Container();
            } else if (state is MovieDetailLoading || state is MovieDetailInitial) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Hero(
                          tag: '${widget.movieDetailArguments.movieId}',
                          child: extendedImage(
                              path: '${ApiConstants.BASE_IMAGE_URL}${widget.movieDetailArguments.poster}' ?? '',
                              width: Sizes.dimen_100.w,
                              height: Sizes.dimen_300.h
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: Sizes.dimen_8.h),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(CupertinoIcons.back, color: AppColors.white,)
                    ),
                  )
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  generateChips(List<Genres?> hashtags) {
    return hashtags.asMap().map((i, element) => MapEntry(i, getChips(element!))).values.toList();
  }

  getChips(Genres data) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_10.w, vertical: Sizes.dimen_4.w),
      decoration: BoxDecoration(
          color: getColor(data.name!),
          borderRadius: BorderRadius.circular(Sizes.dimen_16.w)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            data.name!,
            style: AppStyles.regularTextStyle(fontSize: 12.0, color: AppColors.white),
          ),
        ],
      ),
    );
  }

  getColor(String name) {
    print('MovieDetailScreen: ${name}');
    switch(name) {
      case 'Action':
        return AppColors.aquaGreen;
      case 'Thriller':
        return AppColors.pink;
      case 'Science':
        return AppColors.purpleLight2;
      case 'Fiction':
        return AppColors.gold;
      default:
        return AppColors.purpleLight;
    }
  }
}
