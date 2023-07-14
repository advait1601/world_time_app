import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';
import 'package:world_time_app/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    //this property defines the route the app should start with
    initialRoute: '/',
    //routes property is a map consisting of key-value pairs
    //key - name of the route, value - the route
    routes: {
      '/': (context) => ChooseLocation(), //represents the first widget to be built when the app is first opened (when initialRoute not mentioned)
      '/home': (context) => Home(), //home screen
      '/loading': (context) => Loading(),
    },
  ));
}
