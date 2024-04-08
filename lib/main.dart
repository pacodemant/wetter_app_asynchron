// ignore_for_file: prefer__ructors, prefer_const_constructors

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
      home: const Task563WetterApp(title: '(Task 5.6.3)'),
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
  /* ------------------------------------------ Aufgabe 2 (Verwendung von JSON) */
  /* -------------------------- Schreibe eine Methode des StatefulWidget-State, */
  /* ----------------------------------- die die Werte aus dem JSON-String holt */
  /* ------------------------------- und in die entsprechenden Variablen setzt. */

  static const String jsonString = """
 {
     "latitude": 48.78,
     "longitude": 9.18,
     "current": {
         "time": "2024-01-12T11:45",
         "temperature_2m": -3.6,
         "apparent_temperature": -7.0,
         "is_day": 1,
         "precipitation": 12.00
     }
 }
 """;


//INF - die Daten aus dem JSON-String in die Variablen schreiben
  String? city;
  double? temp;
  double? perceivedTemp;
  double? rain;
  int? daytime;
  //INF - folg. daytimeString ist eine if-Bed. => 1 = Tag, 0 = Nacht
  late String daytimeString = daytime == 1 ? 'Tag' : 'Nacht';
  double? longitude;
  double? latitude;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 250,
          // height: 250,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                color: Colors.amber,
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text('Wedda-Äbb'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Stadt: $city',
                style: TextStyle(
                  fontSize: 18,
                  height: 2,
                  color: Colors.blueGrey,
                ),
              ),
              Text(
                'gefühlte Temp.: $perceivedTemp ',
                style: TextStyle(
                  fontSize: 14,
                  height: 2,
                ),
              ),
              Text(
                'Temperatur: $temp °C',
                style: TextStyle(
                  fontSize: 14,
                  height: 2,
                ),
              ),
              Text(
                'Niederschlag: $rain mm',
                style: TextStyle(
                  fontSize: 12,
                  height: 2,
                ),
              ),
              Text(
                'Tageszeit: $daytimeString',
                style: TextStyle(fontSize: 12),
              ),
              Text(
                'Standort: lat: $latitude, lon: $longitude',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 22),
              ElevatedButton(
                onPressed: () {},
                child: Text('Vorhersage updaten'),
              ),
              SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }
}
