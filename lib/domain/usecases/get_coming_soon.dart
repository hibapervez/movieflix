import 'package:dartz/dartz.dart';
import 'package:movieflix/data/models/movie_model.dart';

import '../entities/app_error.dart';
import '../entities/no_params.dart';
import '../repositories/movie_repository.dart';
import '../usecase.dart';

class GetComingSoon extends UseCase<List<MovieModel>, NoParams> {
  final MovieRepository repository;

  GetComingSoon(this.repository);

  @override
  Future<Either<AppError, List<MovieModel>>> call(NoParams noParams) async {
    return await repository.getComingSoon();
  }
}
