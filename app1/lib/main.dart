import 'package:app1/feature/home/bloc/home_block_bloc.dart';
import 'package:app1/feature/home/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final HomeBlockBloc homebloc = HomeBlockBloc();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: home(),
    );
  }
}
