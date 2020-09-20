import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:trendzz/blocs/model/tv/tvseries.dart';
import 'dart:async';
import 'dart:convert';

class TvPopularBloc {
  ReplaySubject tvpopular = ReplaySubject();
  int page = 1;
  var list = <Results>{};

  Stream get getTvPopular => tvpopular.stream;

  void populateData() {
    http
        .get(
            "https://api.themoviedb.org/3/tv/popular?api_key=148b7c8a2f0e646cffebe4d74d6cdf1e&language=en-US&page=$page")
        .then((value) async {
      if (value.statusCode == 200) {
        await compute(parsejson, value.body).then((value) async {
          List<Results> movies = Tvseries.fromJson(value).results;
          for (var d in movies) {
            list.add(d);
            tvpopular.add(list);
          }
        });
        page++;
      }
    }).catchError((e) {
      tvpopular.addError("Network Error");
    });
  }
}

Map<String, dynamic> parsejson(String value) {
  return json.decode(value);
}
