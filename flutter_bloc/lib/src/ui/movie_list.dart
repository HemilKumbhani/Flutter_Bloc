import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/blocs/movies_bloc.dart';
import 'package:flutter_bloc/src/model/popular_movies_model.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchPopularMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: StreamBuilder(
          stream: bloc.allMovies,
          builder: (context, AsyncSnapshot<PopularMoviesModel> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget buildList(AsyncSnapshot<PopularMoviesModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
            fit: BoxFit.cover,
          );
        });
  }
}
