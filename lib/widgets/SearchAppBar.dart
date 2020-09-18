import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget {
  final callback;

  const SearchAppBar({
    Key key,
    this.callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Trendzz',style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.pink),),
      floating: true,
      actions: [
        IconButton(icon: Icon(Icons.search),onPressed: callback,),
        IconButton(icon: Icon(Icons.info_outline),onPressed: ()=>Navigator.of(context).pushNamed('/about'),)
      ],
    );
  }
}
