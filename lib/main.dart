import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';

/**
 * Routes contém a lista das minhas rotas, sendo / a primeira( base route)
 * context diz onde estamso na wigdet tree
 */
void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes:{
      '/':(context) => Loading(),
      '/home':(context) => Home(),
      '/location': (context) => ChooseLocation(),    }
  ));
}
