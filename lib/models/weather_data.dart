//INF - Klasse für die Wetterdaten
// erhält die Daten aus der API und stellt sie zur Verfügung
class WeatherData {
//==> - erstmal Attribute definieren
  final String city;
  final double temp;
  final double perceivedTemp;
  final double rain;
  final int daytime;
  final double longitude;
  final double latitude;

  WeatherData({
    required this.city,
    required this.temp,
    required this.perceivedTemp,
    required this.rain,
    required this.daytime,
    required this.longitude,
    required this.latitude,
  });

  //==> - folgende Factory-Methode 'WeatherData.fromJson'
  //wandelt die Daten aus der API in ein Objekt um.
  //==> die factory-Methode erzeugt immer eine neue Instanz der Klasse
  // und gibt sie mit Daten gefüllt zurück

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      city: 'Stuttgart',
      temp: json['current']['temperature_2m'],
      perceivedTemp: json['current']['apparent_temperature'],
      rain: json['current']['precipitation'],
      daytime: json['current']['is_day'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }
}
