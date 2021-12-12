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
  bool _buttonVisible = true;
  bool _timerVisible = false;
  String _buttonText = "START TEST";

  final Stopwatch _stopwatch = Stopwatch();

  void _switchState() {
    if (_running) {
      _running = false;

      setState(() {
        _stopwatch.stop();
        _timerVisible = true;
        _buttonText = "START AGAIN";
      });
      return;
    }

    _stopwatch.reset();
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
      _stopwatch.start();
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
                'Click the button to start the test',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 4),
            Visibility(
              visible: !_running,
              child: const Text('After you click the button, it disappears'),
            ),
            Visibility(
              visible: !_running,
              child: const Text('After the button appears again,'),
            ),
            Visibility(
              visible: !_running,
              child: const Text('click it as fast as you can'),
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
            Visibility(
              visible: !_buttonVisible,
              child: const Icon(
                Icons.crop_square_sharp,
                color: Colors.pink,
                size: 64.0,
                semanticLabel: "Click here when the button appears",
              ),
            ),
            const SizedBox(height: 16),
            Visibility(
              visible: _timerVisible,
              child: Text(
                _stopwatch.elapsedMilliseconds.toString() + "ms",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          "/second",
          arguments: "Hello",
        ), // go to highscore menu
        tooltip: 'Highscores',
        child: const Icon(Icons.local_fire_department),
      ),
    );
  }
}
