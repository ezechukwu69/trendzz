import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:trendzz/arguments/ScreenArgument.dart';
import 'package:trendzz/blocs/MainBloc.dart';
import 'package:trendzz/pages/About.dart';
import 'package:trendzz/pages/MovieViewPage.dart';
import 'package:trendzz/pages/TvSeriesPage.dart';
import 'package:trendzz/pages/TvSeriesViewPage.dart';
import 'package:trendzz/pages/TvseriesListPage.dart';
import 'package:trendzz/pages/moviesListPage.dart';
import 'package:trendzz/theme.dart';
import 'package:trendzz/widgets/SearchAppBar.dart';
import 'package:trendzz/widgets/TvSearch.dart';
import 'ad_manager.dart';
import 'pages/MoviePage.dart';
import 'widgets/MyBottomNavigation.dart';
import 'widgets/Search.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MainBloc mainBloc = MainBloc();
  mainBloc.tvOnAirTodayBloc.populateData();
  mainBloc.tvPopularBloc.populateData();
  mainBloc.tvTopRatedBloc.populateData();
  mainBloc.popularBloc.populateData();
  mainBloc.topBloc.populateData();
  mainBloc.upcomingBloc.populateData();
  runApp(MyApp(mainBloc: mainBloc));
}

class MyApp extends StatelessWidget {
  final MainBloc mainBloc;
  MyApp({this.mainBloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: UniqueKey(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(mainBloc: mainBloc),
        "/tvView": (context) => TvViewPage(bloc: mainBloc),
        "/movieView": (context) => MovieViewPage(bloc: mainBloc),
        '/about': (context) => About()
      },
      onGenerateRoute: (settings) {
        if (settings.name == "/moviesListPage") {
          return MaterialPageRoute(
            builder: (context) {
              ScreenArguments args = settings.arguments;
              return MoviesListPage(
                stream: args.bloc,
                callback: args.callback,
                searchbloc: mainBloc.movieSearchBloc,
              );
            },
          );
        } else if (settings.name == "/tvSeriesListPage") {
          return MaterialPageRoute(
            builder: (context) {
              ScreenArguments args = settings.arguments;
              return TvSeriesListPage(
                stream: args.bloc,
                callback: args.callback,
                searchbloc: mainBloc.tvSearchBloc,
              );
            },
          );
        }
        return null;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final MainBloc mainBloc;

  MyHomePage({Key key, this.mainBloc}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  BannerAd _bannerAd;

  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(anchorType: AnchorType.bottom);
  }

  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: AdManager.appId);
     _bannerAd = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.smartBanner,
  );
  _loadBannerAd();
    super.initState();
  }

  @override
void dispose() {
  _bannerAd?.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SearchAppBar(
            callback: () => currentIndex == 1
                ? showSearch(
                    context: context,
                    delegate: TvSearch(bloc: widget.mainBloc.tvSearchBloc))
                : showSearch(
                    context: context,
                    delegate: Search(bloc: widget.mainBloc.movieSearchBloc)),
          ),
          currentIndex == 0
              ? MoviePage(
                  mainBloc: widget.mainBloc,
                )
              : TvSeriesPage(mainBloc: widget.mainBloc)
        ],
      ),
      bottomNavigationBar: MyBottomNavigation(
        currentIndex: currentIndex,
        updateIndex: (i) => setState(() => currentIndex = i),
      ),
    );
  }
}
