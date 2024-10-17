// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/Joke_Bloc/joke_bloc.dart';
import 'Pages/home.dart';
import 'Repositories/joke_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DadJokeBloc(DadJokeRepository()),
      child: MaterialApp(
        title: 'DAD JOKE',
        home: DadJokeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
