import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var url = Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=9c3994290de16f7140dbc27e62cf3163&page=1');
    http.post(url).then((value){
      print('StatusCode: ${value.statusCode}\nResult: ${value.body}');  
    });

    return Scaffold(
      appBar: AppBar(title: Text('Lista de Filmes')),
      body: Container(),
    );
  }
}