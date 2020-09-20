import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trendzz/blocs/model/movies.dart';
import 'package:trendzz/widgets/Search.dart';
import 'package:trendzz/widgets/SearchAppBar.dart';

class MoviesListPage extends StatefulWidget {
  final stream;
  final Function callback;
  final searchbloc;

  MoviesListPage({this.stream, this.callback, this.searchbloc});

  @override
  _MoviesListPageState createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        widget.callback();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: UniqueKey(),
        body: StreamBuilder(
          stream: widget.stream,
          builder: (context, snapshot) {
            Widget error() {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(snapshot.error),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                            onPressed: widget.callback(),
                            child: Text(
                              'Retry',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(color: Colors.red),
                            )),
                      )
                    ],
                  )),
                ),
              );
            }

            var data = <Results>{};
            if (snapshot.hasData) {
              data = snapshot.data;
            }
            return CustomScrollView(controller: _controller, slivers: [
              SearchAppBar(
                callback: () => showSearch(
                    context: context,
                    delegate: Search(bloc: widget.searchbloc)),
              ),
              data != null
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate((context, i) {
                      if (i < data.length) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 30.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'images/abstract-q-g-640-480-1.jpg',
                                    fit: BoxFit.cover,
                                    height: 300.0,
                                  ),
                                  imageUrl:
                                      'https://image.tmdb.org/t/p/original${data.elementAt(i).posterPath}',
                                  placeholder: (context, url) => Container(
                                    height: 300.0,
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                ),
                                ExpansionTile(
                                  title: Text(data
                                      .elementAt(i)
                                      .title),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(data
                                          .elementAt(i)
                                          .overview),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                              '/movieView',
                                              arguments: data.elementAt(i));
                                        },
                                        child: Text(
                                          'more',
                                          style:
                                              TextStyle(color: Colors.green),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return error();
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                    }, childCount: data.length + 1))
                  : SliverFillRemaining(
                      child: snapshot.hasError && !snapshot.hasData
                          ? error()
                          : Center(child: CircularProgressIndicator()))
            ]);
          },
        ));
  }
}
