import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wetter-App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const Task563WetterApp(title: 'Wetter-App (Task 5.6.3)'),
    );
  }
}

class Task563WetterApp extends StatefulWidget {
  const Task563WetterApp({super.key, required this.title});

  final String title;

  @override
  State<Task563WetterApp> createState() => _Task563WetterAppState();
}

class _Task563WetterAppState extends State<Task563WetterApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 55,
            ),
            const Text('Stadt: Stuttgart'),
            const Text('gefühlte Temp.: 20°C'),
            const Text('Temperatur: 12°C'),
            const Text('Niederschlag: 15.000 mm'),
            const Text('Tageszeit: Tag'),
            const Text('STandort: lat: 48.78, lon: 9.18'),
            const SizedBox(
              height: 55,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Vorhersage updaten'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {}),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
