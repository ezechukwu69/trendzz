import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:trendzz/blocs/MainBloc.dart';
import 'package:trendzz/blocs/model/movies.dart';
import 'package:trendzz/model/IndividualMovie.dart';
import 'package:trendzz/widgets/SecondAppBar.dart';

import '../Constants.dart';

class MovieViewPage extends StatefulWidget {
  final MainBloc bloc;

  MovieViewPage({this.bloc, Key key}) : super(key: key);

  @override
  _MovieViewPageState createState() => _MovieViewPageState();
}

class _MovieViewPageState extends State<MovieViewPage> {
  Future<IndividualMovie> getData(int id) async {
    Response rs = await get(
        "https://api.themoviedb.org/3/movie/$id?api_key=148b7c8a2f0e646cffebe4d74d6cdf1e&language=en-US");
    Map<String, dynamic> dt = await compute(parsejson, rs.body);
    return IndividualMovie.fromJson(dt);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle text = Theme.of(context).textTheme.bodyText1;
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
            Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        args.title,
                        style: themes.headline6.copyWith(
                            color: Colors.red, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(child: Text('${args.voteAverage}')),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                args.overview,
                style: text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Release date: ${args.releaseDate}",
                      style: text,
                    ),
                    Text(
                      args.adult ? "18+" : "PG",
                    ),
                  ]),
            ),
            FutureBuilder<IndividualMovie>(
              future: getData(args.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  IndividualMovie data = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Budget: \$ ${data.budget}',
                          style: text,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: data.genres.map((e) => Chip(label: Text(e.name,style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),),backgroundColor: Colors.blue,)).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Vote Count: ${data.voteCount.toString()}',style: text,),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70.0,
                        child: Flex(direction: Axis.horizontal,children: [
                          Flexible(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Production Companies: ',style: text,),
                          ),flex: 5,),
                          Flexible(flex: 8,child: ListView(scrollDirection: Axis.horizontal,children: data.productionCompanies.map((e) => Chip(label: Text('${e.name}',style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),),backgroundColor: Colors.blue,)).toList(),),)
                        ],),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70.0,
                        child: Flex(direction: Axis.horizontal,children: [
                          Flexible(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Production Countries: ',style: text,),
                          ),flex: 5,),
                          Flexible(flex: 8,child: ListView(scrollDirection: Axis.horizontal,children: data.productionCountries.map((e) => Chip(label: Text('${e.name}',style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),),backgroundColor: Colors.blue,)).toList(),),)
                        ],),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70.0,
                        child: Flex(direction: Axis.horizontal,children: [
                          Flexible(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Spoken Languages: ',style: text,),
                          ),flex: 5,),
                          Flexible(flex: 8,child: ListView(scrollDirection: Axis.horizontal,children: data.spokenLanguages.map((e) => Chip(label: Text('${e.name}',style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),),backgroundColor: Colors.blue,)).toList(),),)
                        ],),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70.0,
                        child: Flex(direction: Axis.horizontal,children: [
                          Flexible(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Status: ',style: text,),
                          ),flex: 5,),
                          Flexible(flex: 8,child: Chip(label: Text('${data.status}',style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),),backgroundColor: Colors.blue,),)
                        ],),
                      ),
                    ],
                  );
                }
                else if (snapshot.hasError) {
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => setState(() {}),
                      child: RichText(
                          text: TextSpan(
                              text: "Click to ",
                              style: Theme.of(context).textTheme.bodyText2,
                              children: [
                            TextSpan(
                                text: "retry",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(color: Colors.red))
                          ])),
                    ),
                  ));
                }
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ));
              },
            )
          ]),
        ),
      ]),
    );
  }
}
