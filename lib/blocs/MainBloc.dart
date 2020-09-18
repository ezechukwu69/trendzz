import 'package:trendzz/blocs/movies/PopularBloc.dart';
import 'package:trendzz/blocs/movies/TopRated.dart';
import 'package:trendzz/blocs/movies/Upcoming.dart';
import 'package:trendzz/blocs/searchbloc/MovieSearchBloc.dart';
import 'package:trendzz/blocs/searchbloc/TvSearchBloc.dart';
import 'package:trendzz/blocs/tvseries/TvOnAirToday.dart';
import 'package:trendzz/blocs/tvseries/TvPopularBloc.dart';
import 'package:trendzz/blocs/tvseries/TvTopRated.dart';

class MainBloc {
  PopularBloc popularBloc = PopularBloc();
  TopBloc topBloc = TopBloc();
  UpcomingBloc upcomingBloc = UpcomingBloc();
  TvOnAirTodayBloc tvOnAirTodayBloc = TvOnAirTodayBloc();
  TvPopularBloc tvPopularBloc = TvPopularBloc();
  TvTopRatedBloc tvTopRatedBloc = TvTopRatedBloc();
  MovieSearchBloc movieSearchBloc = MovieSearchBloc();
  TvSearchBloc tvSearchBloc = TvSearchBloc();
}
