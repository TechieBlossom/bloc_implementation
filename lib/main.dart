import 'package:bloc_implementation/pages/HomePage.dart';
import 'package:bloc_implementation/services/repository.dart';
import 'package:bloc_implementation/themes/themes.dart';
import 'package:flutter/material.dart';

void main() {
  PlayerRepository _repository = PlayerRepository();

  runApp(MyApp(playerRepository: _repository,));
}

class MyApp extends StatelessWidget {

  final PlayerRepository playerRepository;

  MyApp({this.playerRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Implementation',
      theme: ThemeData(
        canvasColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          textTheme: TextTheme(
            title: appBarTextStyle.copyWith(fontWeight: FontWeight.w600)
          ),
          iconTheme: IconThemeData(
            color: Colors.black
          )
        ),
      ),
      home: HomePage(playerRepository: playerRepository),
    );
  }
}