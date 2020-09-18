import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:trendzz/blocs/MainBloc.dart';
import 'package:trendzz/widgets/MoviesSlide.dart';

import '../ad_manager.dart';

class MoviePage extends StatefulWidget {
  final MainBloc mainBloc;

  MoviePage({this.mainBloc});

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {

  BannerAd _bannerAd;

  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(anchorType: AnchorType.top);
  }

  @override
  void initState() {
     _bannerAd = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.banner,
  );
  _loadBannerAd();
    super.initState();
  }

  @override
void dispose() {
  _bannerAd?.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MoviesSlide(title: "Popular",bloc: widget.mainBloc.popularBloc.getPopular,callback: ()=>
              widget.mainBloc.popularBloc.populateData(),),
              ),
              Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: MoviesSlide(title: "Top Rated",bloc: widget.mainBloc.topBloc.getTop,callback:() => widget.mainBloc.topBloc.populateData()),
              ),
              Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: MoviesSlide(title: "Upcoming",bloc: widget.mainBloc.upcomingBloc.getUpcoming,callback:()=> widget.mainBloc.upcomingBloc.populateData()),
          ),
          ]
      )
    );
  }
}
