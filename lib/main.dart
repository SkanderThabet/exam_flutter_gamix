import 'package:exam_gamix/screens/home.dart';
import 'package:exam_gamix/screens/pays_int.dart';
import 'package:exam_gamix/screens/welcome.dart';
import 'package:exam_gamix/shared/chargement.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Chargement(),
        '/welcome': (context) => const Welcome(),
        '/home': (context) => const Home(),
        '/pays': (context) => const PaysInt(),
      },
    );
  }
}
