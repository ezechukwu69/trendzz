import 'package:flutter/material.dart';
import 'package:trendzz/blocs/MainBloc.dart';
import 'package:trendzz/widgets/TvSeriesSlide.dart';

class TvSeriesPage extends StatefulWidget {
  final MainBloc mainBloc;

  TvSeriesPage({this.mainBloc});

  @override
  _TvSeriesPageState createState() => _TvSeriesPageState();
}

class _TvSeriesPageState extends State<TvSeriesPage> {
  @override
  void initState() {
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
              bloc: widget.mainBloc.tvOnAirTodayBloc.getTvToday,
              callback: () => widget.mainBloc.tvOnAirTodayBloc.populateData(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TvSeriesSlide(
                title: "Top Rated",
                bloc: widget.mainBloc.tvTopRatedBloc.getTvTopRated,
            callback: ()=>widget.mainBloc.tvTopRatedBloc.populateData(),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TvSeriesSlide(
                title: "Popular",
                bloc: widget.mainBloc.tvPopularBloc.getTvPopular,
                callback: ()=>widget.mainBloc.tvPopularBloc.populateData(),),
          ),
        ],
      ),
    );
  }
}
