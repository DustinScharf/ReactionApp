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

  void _incrementCounter() {
    setState(() {
      _running = !_running;
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
            const Text('Click the button to start the reaction test',
                style: TextStyle(fontSize: 18)),
            const SizedBox(height: 4),
            const Text(
                'After the button changed its color, click it as fast as you can'),
            const SizedBox(height: 16),
            TextButton(
                onPressed: () => {_incrementCounter()},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: const Text("Start reaction test")),
            const SizedBox(height: 16),
            Text(
              '$_timer' "ms",
              style: Theme.of(context).textTheme.headline4,
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
