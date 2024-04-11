//home_page.dart
// ignore_for_file: prefer__ructors, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wetter_app_asynchron/models/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//INF - Vom Doz zur Verfügung gestelte Dummy-Daten
/*    static const String jsonStringDummy = """
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
 """;  */
//
  /* -------------------------------------------------------------- json.decode */

  //INF - Deklarierung der Variablen, die die Werte aus dem JSON-String bekommen sollen
  String city = 'Stuttgart';
  late double temp;
  late double perceivedTemp;
  late double rain;
  late int daytime;
  //INF - folg. daytimeString ist eine if-Bed. => 1 = Tag, 0 = Nacht
  String get daytimeString => daytime == 1 ? 'Tag' : 'Nacht';
  late double longitude;
  late double latitude;
  bool isLoading = true;
  /* ---------------------------------------------------------------------- E */

  @override
  void initState() {
    super.initState();
    //INF - eine initState-Methode kann keine async-Methode sein,
    //aber man kann in der initState eine async Methode, hier die initData()
    // die Verzögerung hat den Sinn dafür zu sorgen, dass auch variablen erst zugegriffen wird,
    // wenn Sie initialisiert worden sind
    initData();
  }

  void initData() async {
    await Future.delayed(
      Duration(seconds: 1),
    );

//FIXME - auslagern in ein model
    fetchWeatherData().then(
      (weatherDataMap) {
        setState(
          () {
            city = weatherDataMap['city'];
            temp = weatherDataMap['temp'];
            perceivedTemp = weatherDataMap['perceivedTemp'];

            if (kDebugMode) {
              print('perceivedTemp wurde initialisiert: $perceivedTemp');
            }
            rain = weatherDataMap['rain'];
            daytime = weatherDataMap['daytime'];
            longitude = weatherDataMap['longitude'];
            latitude = weatherDataMap['latitude'];
            isLoading = false;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //INF so lange die Daten geladen werden, wird der ProgressIndicator angezeigt
    // und so lange wartet auch die App auf die Daten.
    // Wenn keine Daten geladen werden, dann wird es Loading fortgesetzt,
    // und dann die Seite neu aufgerufen, dies neu mit den richtigen Scaffold
    if (isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/clouds_in_blue_sky.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.all(3),
                  child: Center(
                    child: Text(
                      'Wedda-Äbb',
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
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
}
