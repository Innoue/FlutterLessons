import 'dart:async';
import 'package:movie_list_4/services/movie_services.dart';

import '../domain/models/movie.dart';

class HomeViewModel{
  MovieService service = MovieService();
  final streamController = StreamController<List<Movie>>();
  int _currentPage = 1;
  List<Movie> _listMovie = [];

  void getMovies(){
    service.getMovies(page: _currentPage).then((value) {
      _listMovie.addAll(value);
      streamController.sink.add(_listMovie);
      _currentPage++;
    });
  }
}