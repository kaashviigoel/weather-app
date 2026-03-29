import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final String forecastTime;
  final IconData forecastIcon;
  final String forecastData;

  const HourlyForecastItem({
    super.key,
    required this.forecastTime,
    required this.forecastIcon,
    required this.forecastData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: Color.fromARGB(194, 56, 56, 68),
      child: Container(
        width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Text(
              forecastTime,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Icon(forecastIcon, size: 40),
            SizedBox(height: 8),
            Text(forecastData),
          ],
        ),
      ),
    );
  }
}
