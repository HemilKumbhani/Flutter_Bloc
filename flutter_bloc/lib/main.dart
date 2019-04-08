import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/ui/movie_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popular Movie',

      routes: <String,WidgetBuilder>{
        '/':(BuildContext context) => MovieList()

      }
    );
  }
}


