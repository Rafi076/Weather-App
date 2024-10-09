import 'package:flutter/material.dart';
import 'weather_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _cityController = TextEditingController();
  Map<String, dynamic>? _weatherData;

  void _fetchWeather() async {
    final city = _cityController.text;
    final data = await WeatherService.fetchWeatherData(city);

    setState(() {
      _weatherData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter city name',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Get Weather'),
            ),
            SizedBox(height: 20),
            _weatherData != null
                ? Column(
                    children: [
                      Text('City: ${_weatherData!['city']}'),
                      Text('Temperature: ${_weatherData!['temperature']} °C'),
                      Text('Humidity: ${_weatherData!['humidity']} %'),
                      Text('Description: ${_weatherData!['description']}'),
                    ],
                  )
                : Text('No weather data'),
          ],
        ),
      ),
    );
  }
}
