import 'dart:convert';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;

class ModelApi {
  final double temp;
  final double humidity;
  final String country;
  final String name;
  final double wind;
  final String situation;
  final int cod;

  ModelApi({
    required this.temp,
    required this.country,
    required this.name,
    required this.humidity,
    required this.wind,
    required this.situation,
    required this.cod,
  });

  factory ModelApi.fromJson(Map<String, dynamic> json) {
    return ModelApi(
      temp: json['main']['temp'].toDouble(),
      country: json['sys']['country'],
      name: json['name'],
      humidity: json['main']['humidity'].toDouble(),
      wind: json['wind']['speed'].toDouble(),
      situation: json['weather'][0]['main'],
      cod: json['cod'],
    );
  }
}

String apiKey = 'a6ea4efed5d9fcdce3d45c55a0e674ed';

class ApiWeather {
  Future<ModelApi> getData(double lat, double lon) async {
    var response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric',
      ),
    );
    var jsan = jsonDecode(response.body);
    ModelApi weather = ModelApi.fromJson(jsan);
    return weather;
  }

  Future<ModelApi> getCountry(String city) async {
    dynamic cityData = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric',
      ),
    );
    dynamic json = jsonDecode(cityData.body);
    ModelApi weather = ModelApi.fromJson(json);
    return weather;
  }

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return Future.error("Location Not enabled");

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  String checkWeather(int weatherCode) {
    if (weatherCode >= 200 && weatherCode < 300) {
      return '⛈️'; // Thunderstorm
    } else if (weatherCode >= 300 && weatherCode < 400) {
      return '🌦️'; // Drizzle
    } else if (weatherCode >= 500 && weatherCode < 600) {
      return '🌧️'; // Rain
    } else if (weatherCode >= 600 && weatherCode < 700) {
      return '❄️'; // Snow
    } else if (weatherCode >= 700 && weatherCode < 800) {
      return '🌫️'; // Fog, Mist, Haze
    } else if (weatherCode == 800) {
      return '☀️'; // Clear Sky
    } else if (weatherCode > 800 && weatherCode <= 804) {
      return '☁️'; // Clouds
    } else {
      return '🤷'; // Unknown weather
    }
  }
}
