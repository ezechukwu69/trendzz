import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trendzz/arguments/ScreenArgument.dart';
import 'package:trendzz/blocs/model/movies.dart';

class MoviesSlide extends StatelessWidget {
  final String title;
  final Stream bloc;
  final Function callback;

  MoviesSlide({@required this.title, @required this.bloc,@required this.callback});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("/moviesListPage", arguments: ScreenArguments(
                      bloc: bloc,
                      callback: callback
                    ));
                  },
                  child: Text(
                    'Show all',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Colors.blue[400]),
                  )),
            )
          ],
        ),
        StreamBuilder(
          stream: bloc,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Results> movies = snapshot.data;
              print(movies.length);
              return Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  cacheExtent: 10.0,
                  itemCount: movies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return i <= 19
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed("/movieView",
                                    arguments: movies[i]);
                              },
                              child: CachedNetworkImage(
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  width:
                                      MediaQuery.of(context).size.width / 3,
                                  key: UniqueKey(),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  imageUrl:
                                      "https://image.tmdb.org/t/p/original${movies[i].posterPath}"),
                            ),
                          )
                        : Container();
                  },
                ),
              );
            } else if(snapshot.hasError) {
              return Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
              child: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.error_outline,color: Colors.red,),
                      ),
                      Text("${snapshot.error}")
                    ],
                  ),
                  FlatButton(onPressed: callback,child: Text('Retry',style: TextStyle(color: Colors.red),),),
                ],
              ),),);
            }
            return Container(
                height: MediaQuery.of(context).size.height / 4,
                child: Center(child: CircularProgressIndicator()));
          },
        )
      ],
    );
  }
}
