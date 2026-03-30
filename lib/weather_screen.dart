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
  double temp = 0.0;

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    try {
      String cityName = 'Kolkata';
      final res = await http.get(
        Uri.parse(
          'https://api.weatherapi.com/v1/forecast.json?key=$WeatherAPIKey&q=$cityName',
        ),
      );
      final data = jsonDecode(res.body);
      temp = data['current']['temp_c'];
      if (res.statusCode != 200) {
        final e = res.statusCode;
        throw Exception(e);
      }
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
              print("Refresh weather data");
            },
          ),
        ],
      ),

      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
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
                                  '$temp°C',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Icon(Icons.cloud, size: 64),
                                const SizedBox(height: 16),
                                const Text(
                                  'Rain',
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
                    "Weather Forecast",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        HourlyForecastItem(
                          forecastData: '301.22',
                          forecastIcon: Icons.cloud,
                          forecastTime: '00:00',
                        ),
                        HourlyForecastItem(
                          forecastData: '315.45',
                          forecastIcon: Icons.wb_sunny,
                          forecastTime: '03:00',
                        ),
                        HourlyForecastItem(
                          forecastData: '300.52',
                          forecastIcon: Icons.cloud,
                          forecastTime: '06:00',
                        ),
                        HourlyForecastItem(
                          forecastData: '305.89',
                          forecastIcon: Icons.wb_sunny,
                          forecastTime: '09:00',
                        ),
                        HourlyForecastItem(
                          forecastData: '300.07',
                          forecastIcon: Icons.cloud,
                          forecastTime: '12:00',
                        ),
                      ],
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
                        infoValue: '94',
                      ),
                      AdditionalInfoItem(
                        infoType: 'Wind Speed',
                        infoIcon: Icons.air,
                        infoValue: '7.67',
                      ),
                      AdditionalInfoItem(
                        infoType: 'Pressure',
                        infoIcon: Icons.beach_access,
                        infoValue: '1006',
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
