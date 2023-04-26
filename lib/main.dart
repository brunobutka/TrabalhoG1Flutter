import 'package:flutter/material.dart';
import 'package:trabalho_g1/confs/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick And Morty API & Map',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: HOME_PAGE,
      routes: routesOfApp,
    );
  }
}