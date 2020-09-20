import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:trendzz/errors/NoDataError.dart';

import '../../Constants.dart';
import '../model/movies.dart';

class PopularBloc {
  ReplaySubject popular = ReplaySubject();
  int page = 1;
  var list = <Results>{};

  Stream get getPopular => popular.stream;

  void populateData() {
    http
        .get(
            "https://api.themoviedb.org/3/movie/popular?api_key=148b7c8a2f0e646cffebe4d74d6cdf1e&language=en-US&page=$page")
        .then((value) async {
      if (value.statusCode == 200 && value.statusCode != 404) {
        await compute(parsejson, value.body).then((value) async {
          List<Results> movies = Movies.fromJson(value).results;
          for (var d in movies) {
            list.add(d);
            popular.add(list);
          }
        });
        page++;
      } else if (value.statusCode == 404) {
        throw NoDataError("No data");
      }
    }).catchError((e) {
      popular.addError("Network Error");
    }
    );
  }

  void dispose() {
    popular.close();
  }
}

