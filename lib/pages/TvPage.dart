import 'package:flutter/material.dart';
import 'package:trendzz/blocs/MainBloc.dart';
import 'package:trendzz/widgets/TvMoviesSlide.dart';

class TvPage extends StatefulWidget {
  final MainBloc mainBloc;

  TvPage({this.mainBloc});

  @override
  _TvPageState createState() => _TvPageState();
}

class _TvPageState extends State<TvPage> {
  @override
  void initState() {
    widget.mainBloc.tvOnAirTodayBloc.populateData();
    widget.mainBloc.tvPopularBloc.populateData();
    widget.mainBloc.tvTopRatedBloc.populateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TvSeriesSlide(
                title: "On Air Today",
                bloc: widget.mainBloc.tvOnAirTodayBloc.getTvToday),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TvSeriesSlide(
                title: "Top Rated",
                bloc: widget.mainBloc.tvTopRatedBloc.getTvTopRated),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TvSeriesSlide(
                title: "Popular",
                bloc: widget.mainBloc.tvPopularBloc.getTvPopular),
          ),
        ],
      ),
    );
  }
}
