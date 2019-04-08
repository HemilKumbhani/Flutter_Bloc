import 'package:flutter_bloc/src/model/popular_movies_model.dart';
import 'package:flutter_bloc/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc{

  final _repository=Repository();
  final _movieFetcher = PublishSubject<PopularMoviesModel>();

  //Creating Observable
  Observable<PopularMoviesModel> get allMovies => _movieFetcher.stream;

  fetchPopularMovies() async{
    PopularMoviesModel  popularMoviesModel=await _repository.getPopularMovies();
    _movieFetcher.sink.add(popularMoviesModel);

  }

  //Disposer to dispose stream object
  dispose(){
    _movieFetcher.close();
  }

}
 final bloc= MoviesBloc();