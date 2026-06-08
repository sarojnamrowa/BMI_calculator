import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:simple_app/Weather/service_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  //bool isLoading = false; // ✅ shows loading indicator

  ApiWeather apiWeather = ApiWeather();

  ModelApi? data;
  double? temp;
  double? humidity;
  String? country;
  String? name;
  double? wind;
  String? situation;
  int? cod;
  DateTime currentDate = DateTime.now();
  String weatherImage = '☁︎';

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff080b30),
      appBar: AppBar(
        backgroundColor: Color(0xff080b30),
        title: Text("Weather Screen", style: TextStyle(color: Colors.white60)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Position position = await apiWeather.getLocation();

          double lat = position.latitude;
          double lon = position.longitude;
          data = await apiWeather.getData(lat, lon);
          setState(() {
            weatherImage = apiWeather.checkWeather(data?.cod ?? 200);
          });
          print('$lat');
          print(lon);

          // dynamic data1 = apiWeather.getCountry(name!);
          print(data?.name);
        },
        child: Icon(Icons.place),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Search',
                labelStyle: TextStyle(color: Colors.white),
                suffixIcon: IconButton(
                  onPressed: () async {
                    String name = controller.text;
                    data = await apiWeather.getCountry(name);
                    setState(() {
                      weatherImage = apiWeather.checkWeather(data?.cod ?? 200);
                    });
                    print(data?.name);
                  },
                  icon: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
          ),
          Text(weatherImage, style: TextStyle(fontSize: 180)),
          Text('${data?.temp ?? 0.0}°', style: TextStyle(color: Colors.white)),
          Text(
            DateFormat.yMMMMEEEEd().format(currentDate),
            style: TextStyle(color: Colors.white),
          ),
          Row(
            children: [
              RowWidgets(
                name: 'Weather',
                image: '☁︎',
                num: '${data?.situation ?? ''}',
              ),
              RowWidgets(
                name: 'Wind',
                image: '💨',
                num: '${data?.wind ?? 0.0}Km/h',
              ),
              RowWidgets(
                name: 'Humidity',
                image: '💧',
                num: '${data?.humidity ?? 0.0}%',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RowWidgets extends StatelessWidget {
  const RowWidgets({
    super.key,
    required this.name,
    required this.image,
    required this.num,
  });

  final String name;
  final String image;
  final String num;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color(0xff1b1e48),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Text(image, style: TextStyle(color: Colors.white, fontSize: 50)),
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(num, style: TextStyle(color: Colors.white, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
