import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';
import 'package:trendzz/blocs/model/tv/tvseries.dart';

class TvOnAirTodayBloc {
  ReplaySubject onairtoday = ReplaySubject();
  int page = 1;
  var list = <Results>{};

  Stream get getTvToday => onairtoday.stream;

  Future<void> setData() async {
    try {
      Response rs = await get(
          "https://api.themoviedb.org/3/tv/airing_today?api_key=148b7c8a2f0e646cffebe4d74d6cdf1e&language=en-US&page=$page");
      if (rs.statusCode == 200) {
        Map<String, dynamic> dt = await compute(parsejson, rs.body);
        if ((dt['results'] as List<dynamic>).length > 0) {
          List<Results> movies = Tvseries.fromJson(dt).results;
          list.addAll(movies.toSet());
          onairtoday.add(list);
          page++;
        } else {
          onairtoday.add(list);
        }
      }
    } catch (e) {
      onairtoday.addError('$e');
    }
  }

  void populateData() {
    setData();
  }
}

Map<String, dynamic> parsejson(String value) {
  return json.decode(value);
}
