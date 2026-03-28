import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
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
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '300°F',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            Icon(Icons.cloud, size: 64),
                            SizedBox(height: 16),
                            Text('Rain', style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Weather Forecast",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Card(
                          elevation: 6,
                          color: Color.fromARGB(194, 56, 56, 68),
                          child: Column(
                            children: [
                              const Text(
                                '03:00',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Icon(Icons.cloud, size: 32),
                              const SizedBox(height: 8),
                              const Text('320.12'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Card(
                          elevation: 6,
                          color: Color.fromARGB(194, 56, 56, 68),
                          child: Column(
                            children: [
                              const Text(
                                '03:00',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Icon(Icons.cloud, size: 32),
                              const SizedBox(height: 8),
                              const Text('320.12'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Card(
                          elevation: 6,
                          color: Color.fromARGB(194, 56, 56, 68),
                          child: Column(
                            children: [
                              const Text(
                                '03:00',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Icon(Icons.cloud, size: 32),
                              const SizedBox(height: 8),
                              const Text('320.12'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Card(
                          elevation: 6,
                          color: Color.fromARGB(194, 56, 56, 68),
                          child: Column(
                            children: [
                              const Text(
                                '03:00',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Icon(Icons.cloud, size: 32),
                              const SizedBox(height: 8),
                              const Text('320.12'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Card(
                          elevation: 6,
                          color: Color.fromARGB(194, 56, 56, 68),
                          child: Column(
                            children: [
                              const Text(
                                '03:00',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Icon(Icons.cloud, size: 32),
                              const SizedBox(height: 8),
                              const Text('320.12'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Placeholder(fallbackHeight: 150),
              const SizedBox(height: 20),
              const Placeholder(fallbackHeight: 150),
            ],
          ),
        ),
      ),
    );
  }
}
