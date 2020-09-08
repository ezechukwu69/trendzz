import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trendzz/blocs/MainBloc.dart';

class SecondAppBar extends StatelessWidget {
  final MainBloc bloc;
  final url;
  final id;

  SecondAppBar({
    this.bloc,
    Key key,
    this.url,
    this.id
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Trendzz'),
      floating: true,
      expandedHeight: MediaQuery.of(context).size.height / 1.3,
      flexibleSpace:
              Hero(
                  tag: id,
                   child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: MediaQuery.of(context).size.width,
                    imageUrl: "https://image.tmdb.org/t/p/original$url"),
              )
    );
  }
}