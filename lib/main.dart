import 'package:flutter/material.dart';
import 'package:reation_app/route_generator.dart';
import './my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reaction App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
