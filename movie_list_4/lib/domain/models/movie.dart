class Movie {
  String title;
  String overview;
  String backdropPath;

  Movie.fromJson(Map json)
      : title = json['title'],
        overview = json['overview'],
        backdropPath = json['backdrop_path'];
}

class MovieData{
  int page;
  List<Movie> movies;

  MovieData(this.page, this.movies);

  factory MovieData.fromJson(Map json){
    final page = json['page'] as int;
    final result = json['results'] as List;
    final movies = result.map((e) => Movie.fromJson(e)).toList();

    return MovieData(page, movies);
  }
}
