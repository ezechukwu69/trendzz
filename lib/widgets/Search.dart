import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trendzz/blocs/model/movies.dart';
import 'package:trendzz/blocs/searchbloc/MovieSearchBloc.dart';

class Search extends SearchDelegate {
  final MovieSearchBloc bloc;
  Results selection;

  Search({this.bloc});
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
        Navigator.of(context).pushNamed('/movieView',arguments: selection);
      },
      child: FractionallySizedBox(
          heightFactor: 0.9,
          widthFactor: 1.0,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: 'https://image.tmdb.org/t/p/original${selection.backdropPath}',
                  placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(selection.title,style: Theme.of(context).textTheme.headline6,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(selection.overview,style: Theme.of(context).textTheme.bodyText1,),
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
                  selection = data[index];
                  showResults(context);
                },
                child: ListTile(
                  title: Text(data[index].title),
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