import 'package:flutter/material.dart';
import 'package:trendzz/blocs/MainBloc.dart';
import 'package:trendzz/widgets/MoviesSlide.dart';

class HomePage extends StatelessWidget {
  final MainBloc mainBloc;

  HomePage({this.mainBloc});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MoviesSlide(title: "Popular",bloc: mainBloc.popularBloc.getPopular),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MoviesSlide(title: "Top Rated",bloc: mainBloc.topBloc.getTop),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MoviesSlide(title: "Upcoming",bloc: mainBloc.upcomingBloc.getUpcoming),
          ),
          ]
      )
    );
  }
}
