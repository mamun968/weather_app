import 'package:flutter/material.dart';

IconData getIconData(String iconName) {
  switch (iconName) {
    case '01d':
      return Icons.wb_sunny;
    case '01n':
      return Icons.nights_stay;
    case '02d':
      return Icons.wb_cloudy;
    case '02n':
      return Icons.cloud;
    case '03d':
    case '03n':
      return Icons.cloud;

    case '11d':
    case '11n':
      return Icons.bolt;
    case '13d':
    case '13n':
      return Icons.ac_unit;
    case '50d':
    case '50n':
      return Icons.cloud;
    default:
      return Icons.sunny;
  }
}
