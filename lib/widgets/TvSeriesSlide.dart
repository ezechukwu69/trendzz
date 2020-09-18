import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trendzz/arguments/ScreenArgument.dart';
import 'package:trendzz/blocs/model/tv/tvseries.dart';

class TvSeriesSlide extends StatelessWidget {
  final String title;
  final bloc;
  final Function callback;
  TvSeriesSlide({this.title, this.bloc,this.callback});
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
              child: FlatButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/tvSeriesListPage",arguments:
                    ScreenArguments(
                      bloc: bloc,
                      callback: callback,
                    ));
                  },
                  icon: Icon(
                    Icons.launch,
                    color: Colors.blue[400],
                  ),
                  label: Text(
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
              List<Results> tvSeries = snapshot.data;
              print(tvSeries.length);
              return Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  cacheExtent: 10.0,
                  itemCount: tvSeries.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return i <= 19
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed("/tvView",
                                    arguments: tvSeries[i]);
                                    //  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => TvViewPage(),settings: RouteSettings(arguments: tvSeries[i])));
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
                                        "https://image.tmdb.org/t/p/original${tvSeries[i].posterPath}"),
                              ),
                          )
                        : Container();
                  },
                ),
              );
            }  else if(snapshot.hasError) {
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
            else if (snapshot.connectionState == ConnectionState.active) {
              return Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: Center(child: CircularProgressIndicator()));
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
