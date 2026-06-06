import 'dart:convert';

import 'package:http/http.dart' as http;

class ModelApi {
  final double temp;
  final double humidity;
  final String country;
  final String name;

  ModelApi({
    required this.temp,
    required this.country,
    required this.name,
    required this.humidity,
  });

  factory ModelApi.fromJson(Map<String, dynamic> json) {
    return ModelApi(
      temp: json['main']['temp'].toDouble(),
      country: json['sys']['country'],
      name: json['name'],
      humidity: json['main']['humidity'].toDouble(),
    );
  }
}

class ApiWeather {
  String apiKey = 'a6ea4efed5d9fcdce3d45c55a0e674ed';
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
}
