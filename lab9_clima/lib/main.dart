import 'package:flutter/material.dart';
import 'weather.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String city = 'Hà Nội';
  double temperature = 0;
  String weatherDescription = '';

  void getWeather() async {
    Weather weather = Weather();
    var data = await weather.getWeatherByCity(city);

    if (data != null) {
      setState(() {
        temperature = data['main']['temp'];
        weatherDescription = data['weather'][0]['description'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clima - Weather App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$temperature°C', style: TextStyle(fontSize: 50)),
            Text(weatherDescription, style: TextStyle(fontSize: 20)),
            TextField(
              onChanged: (value) => city = value,
              decoration: InputDecoration(hintText: 'Nhập tên thành phố'),
            ),
            ElevatedButton(
              onPressed: getWeather,
              child: Text('Lấy thời tiết'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: WeatherScreen()));
}
