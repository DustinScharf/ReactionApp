import 'package:flutter/material.dart';

class HighscorePage extends StatefulWidget {
  final String data;

  const HighscorePage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _HighscorePageState createState() => _HighscorePageState();
}

class _HighscorePageState extends State<HighscorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Highscores"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Coming Soon..."),
          ],
        ),
      ),
    );
  }
}
