import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meowfacts/service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CatAPI api = CatAPI();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: api.facts(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Text('loading facts...');
          } else {
            return Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                snapshot.data,
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
    );
  }
}
