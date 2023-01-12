class TreandingMovieModel {
  final String overview;
  final String title;
  final String backdrop_path;
  final String poster_path;
  final String vote_average;
  final String release_date;

  TreandingMovieModel(
      {required this.overview,
      required this.title,
      required this.backdrop_path,
      required this.poster_path,
      required this.vote_average,
      required this.release_date});

  factory TreandingMovieModel.fromJson(Map data) {
    return TreandingMovieModel(
        overview: data['overview'] ?? "N/A",
        title: data['title'] ?? "N/A",
        backdrop_path: data['backdrop_path'] ?? "N/A",
        poster_path: data['poster_path'] ?? "N/A",
        vote_average: data['vote_average'] ?? "N/A",
        release_date: data['release_date'] ?? false);
  }
}
