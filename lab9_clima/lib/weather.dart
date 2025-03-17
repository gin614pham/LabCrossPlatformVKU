import 'dart:convert';
import 'package:http/http.dart' as http;
import 'location.dart';

const String apiKey = 'YOUR_API_KEY'; // Thay bằng API Key của bạn
const String weatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class Weather {
  Future<dynamic> getWeatherByLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    if (location.latitude == null || location.longitude == null) return null;

    String url =
        '$weatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    return await fetchData(url);
  }

  Future<dynamic> getWeatherByCity(String city) async {
    String url = '$weatherURL?q=$city&appid=$apiKey&units=metric';
    return await fetchData(url);
  }

  Future<dynamic> fetchData(String url) async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Lỗi API: ${response.statusCode}');
      return null;
    }
  }
}
