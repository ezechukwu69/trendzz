import 'package:flutter/material.dart';
import 'package:trendzz/blocs/MainBloc.dart';
import 'package:trendzz/pages/MovieViewPage.dart';
import 'pages/HomePage.dart';
import 'widgets/MyAppBar.dart';
import 'widgets/MyBottomNavigation.dart';

void main() {
  MainBloc mainBloc = MainBloc();
  runApp(MyApp(mainBloc: mainBloc));
}

class MyApp extends StatelessWidget {
  final MainBloc mainBloc;
  MyApp({this.mainBloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkTheme(),
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(mainBloc: mainBloc),
        "/movieView": (context) => MovieViewPage(bloc: mainBloc),
      },
    );
  }

  ThemeData darkTheme() {
    Color mainContrastColor = Colors.white;
    return ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          centerTitle: true,
        ),
        scaffoldBackgroundColor: Color(0xFF222831),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF07031a),
          selectedItemColor: mainContrastColor,
          unselectedItemColor: Colors.white12,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
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

class MyHomePage extends StatefulWidget {
  final MainBloc mainBloc;

  MyHomePage({Key key, this.mainBloc}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  @override
  void initState() {
    widget.mainBloc.popularBloc.populateData();
    widget.mainBloc.topBloc.populateData();
    widget.mainBloc.upcomingBloc.populateData();
    // widget.mainBloc.posterBloc.addPoster;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MyAppBar(bloc: widget.mainBloc),
          currentIndex == 0
              ? HomePage(
                  mainBloc: widget.mainBloc,
                )
              : SliverFillRemaining(child: FlutterLogo())
        ],
      ),
      bottomNavigationBar: MyBottomNavigation(
        currentIndex: currentIndex,
        updateIndex: (i) => setState(() => currentIndex = i),
      ),
    );
  }
}
