import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle text = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: Text('Trendzz',style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.pink))
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Images by freepik.com',style: text),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Documentation by Flutter.dev',style: text))
        ]
      )
    );
  }
}
