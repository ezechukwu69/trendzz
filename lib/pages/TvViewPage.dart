import 'package:flutter/material.dart';
import 'package:trendzz/blocs/MainBloc.dart';
import 'package:trendzz/blocs/model/tv/tvseries.dart';
import 'package:trendzz/widgets/ThirdAppBar.dart';

class TvViewPage extends StatefulWidget {
  final MainBloc bloc;
  TvViewPage({this.bloc, Key key}) : super(key: key);

  @override
  _TvViewPageState createState() => _TvViewPageState();
}

class _TvViewPageState extends State<TvViewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Results  arg = ModalRoute.of(context).settings.arguments;
    TextTheme themes = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(slivers: [
        ThirdAppBar(
          bloc: widget.bloc,
          url: arg.posterPath,
          id: arg.id,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    arg.name,
                    style: themes.headline5.copyWith(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(child: Text('${arg.voteAverage}')),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                arg.overview,
                style: themes.bodyText1.copyWith(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "First Air Date: ${arg.firstAirDate}",
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
