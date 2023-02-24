import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movieflix/presentation/cubits/movies/upcoming_movies_cubit.dart';
import 'package:movieflix/presentation/cubits/navigation/navigation_cubit.dart';
import 'package:movieflix/presentation/cubits/tickets/get_tickets_cubit.dart';
import '../data/core/api_client.dart';
import '../data/data_sources/movie_remote_data_source.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/repositories/movie_repository.dart';
import '../domain/usecases/get_coming_soon.dart';
import '../domain/usecases/get_movie_detail.dart';
import '../presentation/cubits/loading/loading_cubit.dart';
import '../presentation/cubits/movie_detail/movie_detail_cubit.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<GetComingSoon>(() => GetComingSoon(getItInstance()));

  getItInstance
      .registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
    getItInstance(),
  ));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
          () => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetMovieDetail>(
          () => GetMovieDetail(getItInstance()));

  getItInstance.registerFactory(
        () => NavigationCubit(),
  );

  getItInstance.registerFactory(
        () => UpcomingMoviesCubit(
      getComingSoon: getItInstance(),
      loadingCubit: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => MovieDetailCubit(
      loadingCubit: getItInstance(),
      getMovieDetail: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => GetTicketsCubit(),
  );

  getItInstance.registerSingleton<LoadingCubit>(LoadingCubit());
}
