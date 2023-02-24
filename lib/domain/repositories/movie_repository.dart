import 'package:dartz/dartz.dart';
import 'package:movieflix/data/models/movie_detail_model.dart';
import 'package:movieflix/data/models/movie_model.dart';

import '../entities/app_error.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieModel>>> getComingSoon();
  Future<Either<AppError, MovieDetailModel>> getMovieDetail(int id);
}
