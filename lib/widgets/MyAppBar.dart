import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trendzz/blocs/MainBloc.dart';

class MyAppBar extends StatelessWidget {
  final MainBloc bloc;

  const MyAppBar({
    this.bloc,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Trendzz'),
      floating: true,
    );
  }
}
