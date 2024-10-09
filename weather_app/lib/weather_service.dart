import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String _baseUrl = 'http://127.0.0.1:5000/weather';

  static Future<Map<String, dynamic>?> fetchWeatherData(String city) async {
    final response = await http.get(Uri.parse('$_baseUrl?city=$city'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}
