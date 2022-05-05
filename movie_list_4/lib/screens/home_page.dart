import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_list_4/domain/models/movie.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Filmes')),
      body: FutureBuilder<List<Movie>>(
        future: _getMovies(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index){
                final movie = snapshot.data![index];
                return ListTile(
                  title: Text(movie.title),
                  subtitle: Text(movie.overview),
                );
              },
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<Movie>> _getMovies() async {
    var url = Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=9c3994290de16f7140dbc27e62cf3163&page=1');
    final response = await http.post(url);
    final json = jsonDecode(response.body);
    return MovieData.fromJson(json).movies;
  }
}