class MovieDetailArguments {
  final int movieId;
  final String poster;
  String? title;
  String? releaseDate;

  MovieDetailArguments(this.movieId, this.poster, {this.releaseDate, this.title});
}
