import 'package:flutter/material.dart';
import 'package:worldclock_app/pages/choose_loc.dart';
import 'package:worldclock_app/pages/home.dart';
import 'package:worldclock_app/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute : '/',
    routes: {
      '/':(context)=> Loading(),
      '/home':(context)=> Home(),
      '/location':(context)=> ChooseLocation(),
    },
  ));
}

