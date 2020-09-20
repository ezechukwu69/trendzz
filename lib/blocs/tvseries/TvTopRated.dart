import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:trendzz/blocs/model/tv/tvseries.dart';

class TvTopRatedBloc {
  ReplaySubject tvtopratedBloc = ReplaySubject();
  int page = 1;
  var list = <Results>{};

  Stream get getTvTopRated => tvtopratedBloc.stream;

  void populateData() {
    http
        .get(
            "https://api.themoviedb.org/3/tv/top_rated?api_key=148b7c8a2f0e646cffebe4d74d6cdf1e&language=en-US&page=$page")
        .then((value) async {
      if (value.statusCode == 200) {
        await compute(parsejson, value.body).then((value) async {
          List<Results> movies = Tvseries.fromJson(value).results;
          for (var d in movies) {
            list.add(d);
            tvtopratedBloc.add(list);
          }
        });
        page++;
      }
    }).catchError((e) {
      tvtopratedBloc.addError("Network Error");
    });
  }
}

Map<String, dynamic> parsejson(String value) {
  return json.decode(value);
}
