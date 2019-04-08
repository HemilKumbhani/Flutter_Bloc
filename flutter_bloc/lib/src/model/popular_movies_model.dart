import 'dart:convert';

PopularMoviesModel popularMoviesModelFromJson(String str) {
  final jsonData = json.decode(str);
  return PopularMoviesModel.fromJson(jsonData);
}

String popularMoviesModelToJson(PopularMoviesModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class PopularMoviesModel {
  int page;
  int totalResults;
  int totalPages;
  List<Result> results;

  PopularMoviesModel({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) => new PopularMoviesModel(
    page: json["page"],
    totalResults: json["total_results"],
    totalPages: json["total_pages"],
    results: new List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "total_results": totalResults,
    "total_pages": totalPages,
    "results": new List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  Result({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  factory Result.fromJson(Map<String, dynamic> json) => new Result(
    voteCount: json["vote_count"],
    id: json["id"],
    video: json["video"],
    voteAverage: json["vote_average"].toDouble(),
    title: json["title"],
    popularity: json["popularity"].toDouble(),
    posterPath: json["poster_path"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    genreIds: new List<int>.from(json["genre_ids"].map((x) => x)),
    backdropPath: json["backdrop_path"],
    adult: json["adult"],
    overview: json["overview"],
    releaseDate: json["release_date"],
  );

  Map<String, dynamic> toJson() => {
    "vote_count": voteCount,
    "id": id,
    "video": video,
    "vote_average": voteAverage,
    "title": title,
    "popularity": popularity,
    "poster_path": posterPath,
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "genre_ids": new List<dynamic>.from(genreIds.map((x) => x)),
    "backdrop_path": backdropPath,
    "adult": adult,
    "overview": overview,
    "release_date": releaseDate,
  };
}
