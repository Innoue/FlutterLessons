import 'package:flutter/material.dart';
import 'package:movie_list_4/domain/models/movie.dart';
import 'package:movie_list_4/services/movie_services.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  MovieService movieService = MovieService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Filmes')),
      body: FutureBuilder<List<Movie>>(
        future: movieService.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final movie = snapshot.data![index];
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      movie.title,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    movie.overview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
