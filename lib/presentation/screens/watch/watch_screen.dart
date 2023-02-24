import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/common/constants/color_constants.dart';
import 'package:movieflix/common/styles.dart';
import 'package:movieflix/presentation/cubits/movies/upcoming_movies_cubit.dart';
import 'package:movieflix/presentation/screens/watch/movie_list_builder.dart';

import '../../../common/constants/string_constants.dart';
import '../../widgets/app_error_widget.dart';
import '../../widgets/widget_skeletons.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  UpcomingMoviesCubit get movieTabbedCubit =>
      BlocProvider.of<UpcomingMoviesCubit>(context);
  // late UpcomingMoviesCubit movieTabbedCubit;

  @override
  void initState() {
    super.initState();
    movieTabbedCubit.loadUpcomingMovies();
  }

  @override
  void dispose() {
    movieTabbedCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<UpcomingMoviesCubit, UpcomingMoviesState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.watch,
                        style: AppStyles.regularTextStyle(
                            fontSize: 20.0, color: AppColors.black),
                      ),

                      const Icon(
                        Icons.search,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ),

                if (state is UpcomingMoviesChanged)
                  state.movies.isEmpty
                      ? Expanded(
                    child: Center(
                      child: Text(
                        AppStrings.noMovies,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  )
                      : Expanded(
                      child: Container(
                        color: AppColors.lightGrey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: MovieListBuilder(
                              movies: state.movies
                          ),
                        ),
                      )
                  ),
                if (state is UpcomingMoviesLoadError)
                  Expanded(
                    child: AppErrorWidget(
                      errorType: state.errorType,
                      onPressed: () => movieTabbedCubit.loadUpcomingMovies(),
                    ),
                  ),
                if (state is UpcomingMoviesLoading || state is UpcomingMoviesInitial)
                  Expanded(
                    child: skeletonMovieTile(),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
