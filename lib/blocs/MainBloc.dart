import 'package:trendzz/blocs/PopularBloc.dart';
import 'package:trendzz/blocs/TopRated.dart';
import 'package:trendzz/blocs/Upcoming.dart';
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
}
