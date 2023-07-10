import 'package:flutter/material.dart';

Widget currentWeather(String icon, String temp, String location) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(
        icon as IconData?,
        size: 90,
        color: Colors.amber,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        temp,
        style: const TextStyle(color: Colors.white, fontSize: 50),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        location,
        style: const TextStyle(color: Colors.white60, fontSize: 20),
      ),
    ],
  );
}
