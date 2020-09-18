import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import '../model/movies.dart';

class TopBloc {
  ReplaySubject top = ReplaySubject();
  int page = 1;
  List<Results> list = [];

  Stream get getTop => top.stream;


  void populateData() {
       http
          .get(
          "https://api.themoviedb.org/3/movie/top_rated?api_key=148b7c8a2f0e646cffebe4d74d6cdf1e&language=en-US&page=$page")
          .then((value) async {
            if (value.statusCode == 200) {
              await compute(parsejson, value.body).then((value) async {
                List<Results> movies = Movies
                    .fromJson(value)
                    .results;
                for (var d in movies) {
                  list.add(d);
                  top.add(list);
                }
              });
              page++;
            }
      }).catchError((e)=>top.addError("Network Error"));
  }
}
Map<String, dynamic> parsejson(String value) {
  return json.decode(value);
}