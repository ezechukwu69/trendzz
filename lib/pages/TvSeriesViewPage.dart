import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:trendzz/blocs/MainBloc.dart';
import 'package:trendzz/blocs/model/tv/tvseries.dart';
import 'package:trendzz/blocs/movies/PopularBloc.dart';
import 'package:trendzz/model/IndividualTvSeries.dart';
import 'package:trendzz/widgets/SecondAppBar.dart';

class TvViewPage extends StatefulWidget {
  final MainBloc bloc;
  TvViewPage({this.bloc, Key key}) : super(key: key);

  @override
  _TvViewPageState createState() => _TvViewPageState();
}

class _TvViewPageState extends State<TvViewPage> {
  Future<IndividualTvseries> getData(int id) async {
    Response rs = await get(
        "https://api.themoviedb.org/3/tv/$id?api_key=148b7c8a2f0e646cffebe4d74d6cdf1e&language=en-US");
    Map<String, dynamic> dt = await compute(parsejson, rs.body);
    return IndividualTvseries.fromJson(dt);
  }

  Future<Map<String, dynamic>> getMyData(int id) async {
    Response rs = await get(
        "https://api.themoviedb.org/3/tv/$id?api_key=148b7c8a2f0e646cffebe4d74d6cdf1e&language=en-US");
    Map<String, dynamic> dt = await compute(parsejson, rs.body);
    return dt;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle text = Theme.of(context).textTheme.bodyText1;
    Results arg = ModalRoute.of(context).settings.arguments;
    TextTheme themes = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(slivers: [
        SecondAppBar(
          bloc: widget.bloc,
          url: arg.posterPath,
          id: arg.id,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              width: MediaQuery.of(context).size.width,
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        arg.name,
                        style: themes.headline6.copyWith(color: Colors.red),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(child: Text('${arg.voteAverage}')),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                arg.overview,
                style: text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("First Air Date:  ${arg.firstAirDate}", style: text),
            ),
            FutureBuilder<Map<String, dynamic>>(
              future: getMyData(arg.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
//                IndividualTvseries data = snapshot.data;
                  Map<String, dynamic> data = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      data['number_of_seasons'] != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Seasons: ${data['number_of_seasons']}',
                                style: text,
                              ),
                            )
                          : Container(),
                      data['number_of_episodes'] != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Episodes: ${data['number_of_episodes']}',
                                  style: text),
                            )
                          : Container(),
                      data['genres'] != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 70.0,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: (data['genres'] as List<dynamic>)
                                      .map((e) => Chip(
                                            label: Text(
                                              e['name'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                            backgroundColor: Colors.blue,
                                          ))
                                      .toList(),
                                ),
                              ),
                            )
                          : Container(),
                      data['vote_count'] != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Vote Count: ${data['vote_count']}',
                                style: text,
                              ),
                            )
                          : Container(),
                      data['production_companies'] != null
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: 70.0,
                              child: Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Production Companies: ',
                                        style: text,
                                      ),
                                    ),
                                    flex: 5,
                                  ),
                                  Flexible(
                                    flex: 8,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: (data['production_companies']
                                              as List<dynamic>)
                                          .map((e) => Chip(
                                                label: Text(
                                                  '${e['name']}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                                backgroundColor: Colors.blue,
                                              ))
                                          .toList(),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                      data['last_episode_to_air'] != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Previous Episode air date: ${data['last_episode_to_air']['air_date'] != null ? data['last_episode_to_air']['air_date'] : 'Unknown'}',
                                  style: text),
                            )
                          : Container(),
                      data['last_episode_to_air'] != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Previous Episode: ${data['last_episode_to_air']['episode_number'] != null ? data['last_episode_to_air']['episode_number'] : 'Unknown'}',
                                  style: text),
                            )
                          : Container(),
                      Divider(
                        thickness: 2.0,
                        color: Colors.black,
                      ),
                      data['next_episode_to_air'] != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Next Episode air date: ${data['next_episode_to_air']['air_date'] != null ? data['next_episode_to_air']['air_date'] : 'Unknown'}',
                                style: text,
                              ),
                            )
                          : Container(),
                      data['next_episode_to_air'] != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Next Episode: ${data['next_episode_to_air']['episode_number'] != null ? data['next_episode_to_air']['episode_number'] : 'Unknown'}',
                                  style: text),
                            )
                          : Container(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70.0,
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Status: ',
                                  style: text,
                                ),
                              ),
                              flex: 5,
                            ),
                            Flexible(
                              flex: 8,
                              child: Chip(
                                label: Text(
                                  '${data['status'] != null ? data['status'] : 'Unknown'}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(color: Colors.white),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            ),
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
