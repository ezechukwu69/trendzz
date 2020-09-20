import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trendzz/blocs/model/tv/tvseries.dart';
import 'package:trendzz/blocs/searchbloc/TvSearchBloc.dart';

class TvSearch extends SearchDelegate {
  final TvSearchBloc bloc;
  Results selec;

  TvSearch({this.bloc});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/tvView', arguments: selec);
      },
      child: FractionallySizedBox(
          heightFactor: 0.9,
          widthFactor: 1.0,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            selec.backdropPath != null
                ? CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/original${selec.backdropPath}',
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Image.asset('images/abstract-q-g-640-480-1.jpg',
                    fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                selec.name.toString(),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                selec.overview,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ])),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query != null) bloc.populateData(query);
    return StreamBuilder(
      stream: bloc.getSearch,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Results> data = snapshot.data;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  selec = data[index];
                  showResults(context);
                },
                child: ListTile(
                  title: Text(data[index].originalName),
                ),
              );
            },
          );
        }
        return query != null || query != '' ? Center(child: CircularProgressIndicator()): Container();
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    Color mainContrastColor = Colors.white;
    return ThemeData.dark().copyWith(
        hintColor: mainContrastColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: mainContrastColor),
          bodyText2: TextStyle(color: mainContrastColor),
          caption: TextStyle(color: mainContrastColor),
          button: TextStyle(color: mainContrastColor),
          headline1: TextStyle(color: mainContrastColor),
          headline2: TextStyle(color: mainContrastColor),
          headline3: TextStyle(color: mainContrastColor),
          headline4: TextStyle(color: mainContrastColor),
          headline5: TextStyle(color: mainContrastColor),
          headline6: TextStyle(color: mainContrastColor),
          subtitle1: TextStyle(color: mainContrastColor),
          subtitle2: TextStyle(color: mainContrastColor),
        ));
  }
}
