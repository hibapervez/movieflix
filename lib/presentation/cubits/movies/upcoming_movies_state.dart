part of 'upcoming_movies_cubit.dart';

abstract class UpcomingMoviesState extends Equatable {

  const UpcomingMoviesState();

  @override
  List<Object> get props => [];
}

class UpcomingMoviesChanged extends UpcomingMoviesState {
  final List<MovieModel> movies;

  const UpcomingMoviesChanged({required this.movies})
      : super();

  @override
  List<Object> get props => [movies];
}

class UpcomingMoviesInitial extends UpcomingMoviesState {}

class UpcomingMoviesLoadError extends UpcomingMoviesState {
  final AppErrorType errorType;

  const UpcomingMoviesLoadError({
    required this.errorType,
  }) : super();
}

class UpcomingMoviesLoading extends UpcomingMoviesState {
  const UpcomingMoviesLoading({int currentTabIndex = 0})
      : super();
}