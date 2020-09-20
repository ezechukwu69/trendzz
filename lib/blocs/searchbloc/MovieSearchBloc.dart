import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:trendzz/blocs/model/movies.dart';

import '../../Constants.dart';

class MovieSearchBloc {
  ReplaySubject search = ReplaySubject();

  int page = 1;
  List<Results> list = [];

  Stream get getSearch => search.stream;

  Future<void> populateData(String query) async {
    await http
        .get(
        "https://api.themoviedb.org/3/search/movie?api_key=148b7c8a2f0e646cffebe4d74d6cdf1e&language=en-US&query=$query&page=$page&include_adult=false")
        .then((value) async {
      compute(parsejson, value.body).then((value) async {
         Movies movies = Movies.fromJson(value);
         list = movies.results;
        });
    }).then((value) => search.add(list));
  }
}
