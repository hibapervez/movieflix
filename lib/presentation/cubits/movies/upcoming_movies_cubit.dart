import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/movie_model.dart';
import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/get_coming_soon.dart';
import '../loading/loading_cubit.dart';

part 'upcoming_movies_state.dart';

class UpcomingMoviesCubit extends Cubit<UpcomingMoviesState> {
  final GetComingSoon getComingSoon;
  final LoadingCubit loadingCubit;

  UpcomingMoviesCubit({
    required this.getComingSoon,
    required this.loadingCubit,
  }) : super(UpcomingMoviesInitial());

  void loadUpcomingMovies() async {
    loadingCubit.show();
    late Either<AppError, List<MovieModel>> moviesEither;
    moviesEither = await getComingSoon(NoParams());
    emit(moviesEither.fold(
      (l) => UpcomingMoviesLoadError(
        errorType: l.appErrorType,
      ),
      (movies) {
        return UpcomingMoviesChanged(
          movies: movies,
        );
      },
    ));
  }
}
