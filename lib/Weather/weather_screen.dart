import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:simple_app/Weather/service_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  //bool isLoading = false; // ✅ shows loading indicator

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

  ApiWeather apiWeather = ApiWeather();
  ModelApi? data;
  double? temp;
  double? humidity;
  String? country;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Weather Screen", style: TextStyle(color: Colors.white60)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Position position = await getLocation();

          double lat = position.latitude;
          double lon = position.longitude;
          data = await apiWeather.getData(lat, lon);
          setState(() {});
          print('Lat: ${position.latitude}');
          print('Lon: ${position.longitude}');
        },
        child: Icon(Icons.place),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(6),
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.white,
                Colors.grey,
                Colors.purple,
                Colors.green,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Temperature is ${data?.temp ?? 0.0}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Country = ${data?.country ?? ''}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Name of place : ${data?.name ?? ''}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Humidity : ${data?.humidity ?? 0.0} ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
