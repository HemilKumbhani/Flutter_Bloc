import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/TMDBConfig.dart';
import 'package:flutter_bloc/src/model/popular_movies_model.dart';


//Api call
class MovieApiProvider {
  Future<PopularMoviesModel> getPopularMovies() async {
    String movies = 'https://api.themoviedb.org/3/movie/popular?api_key=' +
        TMDBConfig.apiKey +
        '&page=' +
        '1';

    var httpClient = new HttpClient();
    try {
      var request = await httpClient.getUrl(Uri.parse(movies));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var jsonResponse = await response.transform(utf8.decoder).join();
        var data = jsonDecode(jsonResponse);
        return PopularMoviesModel.fromJson(data);
      } else {
        print("call failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
