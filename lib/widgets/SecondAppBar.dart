import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trendzz/blocs/MainBloc.dart';

class SecondAppBar extends StatelessWidget {
  final MainBloc bloc;
  final url;
  final int id;

  SecondAppBar({
    this.bloc,
    Key key,
    this.url,
    this.id
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(color: Colors.pink),
      title: Text('Trendzz',style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.pink),),
      floating: true,
      expandedHeight: MediaQuery.of(context).size.height / 1.3,
      collapsedHeight: MediaQuery.of(context).size.height / 1.3,
      snap: true,
      flexibleSpace:
              CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: MediaQuery.of(context).size.width,
               imageUrl: "https://image.tmdb.org/t/p/original$url")
    );
  }
}