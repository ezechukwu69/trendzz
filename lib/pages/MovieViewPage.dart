import 'package:flutter/material.dart';
import 'package:trendzz/blocs/MainBloc.dart';
import 'package:trendzz/blocs/model/movies.dart';
import 'package:trendzz/widgets/SecondAppBar.dart';

class MovieViewPage extends StatefulWidget {
  final MainBloc bloc;
  MovieViewPage({this.bloc, Key key}) : super(key: key);

  @override
  _MovieViewPageState createState() => _MovieViewPageState();
}

class _MovieViewPageState extends State<MovieViewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme themes = Theme.of(context).textTheme;
    final Results args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(slivers: [
        SecondAppBar(
          bloc: widget.bloc,
          url: args.posterPath,
          id: args.id,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                args.title,
                style: themes.headline5
                    .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                args.overview,
                style: themes.bodyText1.copyWith(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Release date: ${args.releaseDate}",
                      style: themes.caption
                          .copyWith(color: Colors.green[200], fontSize: 13),
                    ),
                    Text(
                      args.adult ? "18+" : "PG",
                      style: themes.caption
                          .copyWith(color: Colors.green[200], fontSize: 13),
                    ),
                  ]),
            ),
          ]),
        ),
      ]),
    );
  }
}
