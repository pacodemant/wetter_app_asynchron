//home_page.dart
// ignore_for_file: prefer__ructors, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wetter_app_asynchron/repositories/weather_repositories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherRepository weatherRepository = WeatherRepository();

  ///==> - Vom Doz zur Verfügung gestelte Dummy-Daten
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

 //==> - Deklarierung der Variablen, die die Werte aus dem JSON-String bekommen sollen
 //INF - ich habe die Deklarationen nullable gemacht, damit kein roter Alarmscreen kommt,
 // der sagt, das die Variablen nicht initialisiert seien
  String city = 'Stuttgart';
  double? temp;
  double? perceivedTemp;
  double? rain;
  int? daytime;
 //==> - folg. daytimeString ist eine if-Bed. => 1 = Tag, 0 = Nacht
  String get daytimeString => daytime == 1 ? 'Tag' : 'Nacht';
  double? longitude;
  double? latitude;
  bool isLoading = false;
  /* ---------------------------------------------------------------- declare E*/

  @override
  void initState() {
    super.initState();
    //==> - eine initState-Methode kann keine async-Methode sein,
    //aber man kann in der initState eine async Methode, hier die initData()
    // die Verzögerung hat den Sinn dafür zu sorgen, dass auch variablen erst zugegriffen wird,
    // wenn Sie initialisiert worden sind
    
    // initData();
    //==> - soll die Daten nichtgleich beim Start laden, 
    // sondern erst wenn der Button gedrückt wird
  }

  void initData() async {
    await Future.delayed(
      Duration(seconds: 1),
    );
    updateWeatherData();
  }

//==> Zugriff auf Eigenschaften der ursprünglichen Map weatherDataMap
//==> ändern in Zugriff auf Eigenschaften des WeatherData-Objekt
// BEispiel: weatherData['temp'] ==> weatherData.temp
//INF -
  void updateWeatherData() {
    weatherRepository.fetchWeatherData().then(
      (weatherDataMap) {
        setState(
          () {
            city = weatherDataMap.city;
            temp = weatherDataMap.temp;
            perceivedTemp = weatherDataMap.perceivedTemp;

            if (kDebugMode) {
              print('perceivedTemp wurde initialisiert: $perceivedTemp');
            }
            rain = weatherDataMap.rain;
            daytime = weatherDataMap.daytime;
            longitude = weatherDataMap.longitude;
            latitude = weatherDataMap.latitude;
            isLoading = false;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //==> so lange die Daten geladen werden, wird der ProgressIndicator angezeigt
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
                  /*==> - Callback:
                   In Dart und vielen anderen Programmiersprachen ist es üblich, eine Funktion oder Methode als Argument an eine andere Funktion oder Methode zu übergeben. In diesem Fall übergeben Sie die Methode selbst, nicht das Ergebnis ihrer Ausführung.
                  
                  Wenn Sie Klammern hinter den Methodennamen setzen, wie updateWeatherData(), rufen Sie die Methode sofort auf und das Ergebnis dieser Ausführung wird an onPressed übergeben. In diesem Fall erwartet onPressed eine Funktion, die aufgerufen wird, wenn der Button gedrückt wird, nicht das Ergebnis der Funktion.
                  
                  Indem Sie updateWeatherData ohne Klammern übergeben, stellen Sie sicher, dass die Methode erst aufgerufen wird, wenn der Button tatsächlich gedrückt wird. Dieses Konzept wird oft als "Callback-Funktion" oder "Handler-Funktion" bezeichnet.
                  */
                  onPressed: updateWeatherData,
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
