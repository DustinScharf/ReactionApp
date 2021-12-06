import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _running = false;
  double _timer = 0.0;
  bool _buttonVisible = true;
  bool _timerVisible = false;
  String _buttonText = "START TEST";

  void _switchState() {
    if (_running) {
      _running = false;

      setState(() {
        _buttonText = "START AGAIN";
      });
      return;
    }

    _running = true;
    Random random = Random();
    const timeout = Duration(seconds: 3);
    const ms = Duration(milliseconds: 1);
    Timer startTimeout([int? milliseconds]) {
      var duration = milliseconds == null ? timeout : ms * milliseconds;
      return Timer(duration, handleTimeout);
    }

    setState(() {
      _timerVisible = false;
      _buttonVisible = false;
    });

    startTimeout(random.nextInt(4000) + 1000);
  }

  void handleTimeout() {
    setState(() {
      _buttonText = "NOW CLICK";
      _buttonVisible = true;
      _timerVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: !_running,
              child: const Text(
                'Click the button to start the reaction test',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 4),
            Visibility(
              visible: !_running,
              child: const Text(
                  'After the button changed its color, click it as fast as you can'),
            ),
            const SizedBox(height: 16),
            Visibility(
              visible: _buttonVisible,
              child: TextButton(
                  onPressed: () => _switchState(),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(32.0),
                    primary: Colors.white,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    _buttonText,
                    style: const TextStyle(fontSize: 18.0),
                  )),
            ),
            const SizedBox(height: 16),
            Visibility(
              visible: _timerVisible,
              child: Text(
                '$_timer' "ms",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // go to highscore menu
        tooltip: 'Highscores',
        child: const Icon(Icons.local_fire_department),
      ),
    );
  }
}
