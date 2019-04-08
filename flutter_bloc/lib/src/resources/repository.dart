import 'package:flutter_bloc/src/model/popular_movies_model.dart';
import 'package:flutter_bloc/src/resources/movie_api_provider.dart';

class Repository {

  final movieApiProvider = MovieApiProvider();

  //Returns data from api call
  Future<PopularMoviesModel> getPopularMovies() =>
      movieApiProvider.getPopularMovies();

}
