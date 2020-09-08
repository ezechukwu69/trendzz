import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'model/movies.dart';

class UpcomingBloc {
  BehaviorSubject top = BehaviorSubject();
  int page = 1;
  List<Results> list = [];

  Stream get getUpcoming => top.stream;

  Future<void> populateData() async {
    await http
        .get(
            "https://api.themoviedb.org/3/movie/upcoming?api_key=148b7c8a2f0e646cffebe4d74d6cdf1e&language=en-US&page=$page")
        .then((value) async {
      compute(parsejson, value.body).then((value) async {
        List<Results> movies = Movies.fromJson(value).results;
          for (var d in movies) {
          list.add(d);
          top.add(list);
        }
      });
    });
  }
}

Map<String, dynamic> parsejson(String value) {
  return json.decode(value);
}