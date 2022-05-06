import 'dart:async';
import 'dart:convert';
import '../domain/models/movie.dart';
import 'package:http/http.dart' as http;


class MovieService{
  static const String key = '9c3994290de16f7140dbc27e62cf3163';
  static const String baseUrl = 'https://api.themoviedb.org/3/movie/popular';

  Future<List<Movie>> getMovies({int page = 1}) async {
    var url = Uri.parse('$baseUrl?api_key=$key&page=$page');
    final response = await http.post(url);
    final json = jsonDecode(response.body);
    return MovieData.fromJson(json).movies;
  }
}