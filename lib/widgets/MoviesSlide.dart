import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trendzz/blocs/model/movies.dart';
import 'package:trendzz/pages/MovieViewPage.dart';

class MoviesSlide extends StatelessWidget {
  final String title;
  final bloc;

  MoviesSlide({this.title, this.bloc});
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
                        .bodyText2
                        .copyWith(color: Colors.white),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton.icon(
                  onPressed: () {},
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("/movieView",arguments: movies[i]);
                        },
                        child: Hero(
                          tag: movies[i].id,
                          child: CachedNetworkImage(
                              height: MediaQuery.of(context).size.height / 4,
                              width: MediaQuery.of(context).size.width / 3,
                              key: UniqueKey(),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              imageUrl:
                                  "https://image.tmdb.org/t/p/original${movies[i].posterPath}"),
                        ),
                      ),
                    );
                  },
                ),
              );
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
