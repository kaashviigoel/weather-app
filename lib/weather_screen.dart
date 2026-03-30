import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/hourly_forecast_item.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weather;

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
  }

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = 'Kolkata';
      final res = await http.get(
        Uri.parse(
          'https://api.weatherapi.com/v1/forecast.json?key=$WeatherAPIKey&q=$cityName',
        ),
      );
      final data = jsonDecode(res.body);
      if (res.statusCode != 200) {
        final e = res.statusCode;
        throw Exception(e);
      }
      return data;
    } catch (e) {
      throw 'Error fetching weather data';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                weather = getCurrentWeather();
              });
            },
          ),
        ],
      ),

      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator.adaptive());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error.toString()}'));
          }

          final weatherData = snapshot.data!;
          final currentTemp = weatherData['current']['temp_c'];
          final currentSky = weatherData['current']['condition']['text'];
          final humidity = weatherData['current']['humidity'];
          final windspeed = weatherData['current']['wind_kph'];
          final pressure = weatherData['current']['pressure_mb'];
          final hourly = weatherData['forecast']['forecastday'][0]['hour'];

          return Container(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: Color.fromARGB(194, 56, 56, 68),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  '$currentTemp°C',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                currentSky == 'Sunny' || currentSky == 'Clear'
                                    ? const Icon(Icons.wb_sunny, size: 64)
                                    : const Icon(Icons.cloud, size: 64),
                                const SizedBox(height: 16),
                                Text(
                                  '$currentSky',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),
                  const Text(
                    "Hourly Forecast",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(
                    height: 120,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < 24; i += 6)
                            HourlyForecastItem(
                              forecastData: hourly[i]['temp_c'],
                              forecastIcon:
                                  hourly[i]['condition']['text'] == 'Sunny' ||
                                      hourly[i]['condition']['text'] == 'Clear'
                                  ? Icons.wb_sunny
                                  : Icons.cloud,
                              forecastTime: hourly[i]['time'].split(' ')[1],
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Additional Information",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AdditionalInfoItem(
                        infoType: 'Humidity',
                        infoIcon: Icons.water_drop,
                        infoValue: '$humidity%',
                      ),
                      AdditionalInfoItem(
                        infoType: 'Wind Speed',
                        infoIcon: Icons.air,
                        infoValue: '$windspeed kph',
                      ),
                      AdditionalInfoItem(
                        infoType: 'Pressure',
                        infoIcon: Icons.beach_access,
                        infoValue: '$pressure mb',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
