class Movies {
  List<Movie> items = [];

  Movies();

  Movies.fromJsonList(List<dynamic> jsonList) {
    if (jsonList.isEmpty) return;

    for (var item in jsonList) {
      final pelicula = Movies.fromJsonMap(item);
      items.add(pelicula);
    }
  }

  static fromJsonMap(Map<String, dynamic> json) {
    final movie = Movie(
      voteCount: json['vote_count'],
      id: json['id'],
      video: json['video'],
      voteAverage: json['vote_average'] / 1,
      title: json['title'],
      popularity: json['popularity'] / 1,
      posterPath: json['poster_path'] ?? 'imgs/nia.jpg',
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      genreIds: json['genre_ids'].cast<int>(),
      backdropPath: json['backdrop_path'] ?? 'imgs/loading.gif',
      adult: json['adult'],
      overview: json['overview'],
      releaseDate: json['release_date'],
    );
    return movie;
  }
}

class Movie {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  Movie({
    required this.voteCount,
    required this.id,
    required this.video,
    required this.voteAverage,
    required this.title,
    required this.popularity,
    required this.posterPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.genreIds,
    required this.backdropPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
  });

  getPosterPath() {
    return 'https://image.tmdb.org/t/p/w500/$posterPath';
  }

  getBackdropPath() {
    return 'https://image.tmdb.org/t/p/w500/$backdropPath';
  }
}
