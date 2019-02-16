import 'package:bloc_implementation/pages/HomePage.dart';
import 'package:bloc_implementation/services/repository.dart';
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
      home: HomePage(playerRepository: playerRepository),
    );
  }
}