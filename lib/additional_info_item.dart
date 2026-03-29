import 'package:flutter/material.dart';

class AdditionalInfoItem extends StatelessWidget {
  final IconData infoIcon;
  final String infoType;
  final String infoValue;

  const AdditionalInfoItem({
    super.key,
    required this.infoIcon,
    required this.infoType,
    required this.infoValue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Icon(infoIcon, size: 40),
          SizedBox(height: 8),
          Text(infoType),
          SizedBox(height: 8),
          Text(
            infoValue,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
