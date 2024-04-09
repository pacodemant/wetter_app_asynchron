// ignore_for_file: prefer__ructors, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* ------------------------------------------ Aufgabe 2 (Verwendung von JSON) */
  /* -----------------------5.  Schreibe eine Methode des StatefulWidget-State, */
  /* ----------------------------------- die die Werte aus dem JSON-String holt */
  /* ------------------------------- und in die entsprechenden Variablen setzt. */

  static const String jsonStringDummy = """
 {
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

  /* -------------------------------------------------------------- json.decode */
  //INF - holt die Werte aus dem JSON-String und schreibt sie in eine Map
  Map<String, dynamic> weatherData = json.decode(jsonStringDummy);

  //INF - die Variablen, die die Werte aus dem JSON-String bekommen sollen
  String? city = 'Stuttgart';
  double? temp;
  double? perceivedTemp;
  double? rain;
  int? daytime;
  //INF - folg. daytimeString ist eine if-Bed. => 1 = Tag, 0 = Nacht
  late String daytimeString = daytime == 1 ? 'Tag' : 'Nacht';
  double? longitude;
  double? latitude;
  /* ---------------------------------------------------------------------- E */

  //INF Aufgabe: Schreibe eine Methode des StatefulWidget-State, die die Werte aus dem
  //JSON-String "jsonStringDummy" holt und in die entsprechenden Variablen setzt.

  void fetchWeatherData() {
    city = 'Stuttgart';
    temp = weatherData['current']['temperature_2m'];
    perceivedTemp = weatherData['current']['apparent_temperature'];
    rain = weatherData['current']['precipitation'];
    daytime = weatherData['current']['is_day'];
    daytimeString = daytime == 1 ? 'Tag' : 'Nacht';
    longitude = weatherData['longitude'];
    latitude = weatherData['latitude'];
  }

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
                  height: 2.0,
                  color: Colors.blueGrey,
                ),
              ),
              Text(
                'gefühlte Temp.: $perceivedTemp ',
                style: TextStyle(
                  fontSize: 14,
                  height: 2.0,
                ),
              ),
              Text(
                'Temperatur: $temp °C',
                style: TextStyle(
                  fontSize: 14,
                  height: 2.0,
                ),
              ),
              Text(
                'Niederschlag: $rain mm',
                style: TextStyle(
                  fontSize: 12,
                  height: 2.0,
                ),
              ),
              Text(
                'Tageszeit: $daytimeString',
                style: TextStyle(fontSize: 12, height: 2.0),
              ),
              Text(
                'Standort: lat: $latitude, lon: $longitude',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 22),
              ElevatedButton(
                onPressed: () {
                  fetchWeatherData();
                  setState(() {});
                },
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
