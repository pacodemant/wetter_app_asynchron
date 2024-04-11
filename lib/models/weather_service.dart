//weather_service.dart


//INF - fetchWeatherData() holt die Wetterdaten aus der JSON-Datei einer API
// und stellt sie zur Verfügung — UND NUR DAS! Kein setState() oder ähnliches!





/* Alte fetchWeatherData() Methode, die neue ist jetzt i.d. weather_repositories.dart
Future<Map<String, dynamic>> fetchWeatherData() async {
  final responseAPI = await http.get(
    //==> - OBEN: API-Anfrage dauert, daher async&await

    /*==> Uri.parse()
 UNTEN: Die parse() Methode ist eine Funktion in Dart, die verwendet wird, um einen String in ein bestimmtes Format  oder eine bestimmte Datenstruktur umzuwandeln. In diesem Fall wird Uri.parse() verwendet, um einen String in ein Uri-Objekt umzuwandeln. Hier: Uri.parse() wandelt die URL der Wetter-API, die als String vorliegt, in ein Uri-Objekt um und übergibt es an die  http.get()-Methode
 */

    Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=48.783333&longitude=8.183333&current=temperature_2m,apparent_temperature,is_day,precipitation&timezone=Europe%2FBerlin&forecast_days=1'),
  );

//==> - Trifft Antwort ein, wird der Status der Antwort geprüft
// wenn Anfrage erfolgreich (Code: 200), wandelt jsonDecode(response.body) den JSON-String in ein Map-Objekt um

  if (responseAPI.statusCode == 200) {
    // ignore: avoid_print
    //print(response.body); //INF - Terminalausgabe: JSON-String
    final weatherDataMap = jsonDecode(responseAPI.body);
    return {
      'city': 'Stuttgart',
      'temp': weatherDataMap['current']['temperature_2m'],
      'perceivedTemp': weatherDataMap['current']['apparent_temperature'],
      'rain': weatherDataMap['current']['precipitation'],
      'daytime': weatherDataMap['current']['is_day'],
      'longitude': weatherDataMap['longitude'],
      'latitude': weatherDataMap['latitude'],
    };
  } else {
    throw Exception(
        'Hab\' Petrus nicht erreichen können. Fehlercode: ${responseAPI.statusCode}');
  }
}
 */