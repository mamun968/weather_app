import 'package:flutter/material.dart';

TextStyle titleS = const TextStyle(
    color: Colors.white60, fontSize: 20, fontWeight: FontWeight.w400);

TextStyle infoS = const TextStyle(
    color: Colors.white, fontSize: 16, fontWeight: FontWeight.w200);
Widget additionalInformation(
    String wind, String humidity, String pressure, String feels_like) {
  return SizedBox(
    width: double.infinity,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wind:",
                    style: titleS,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Humidity:",
                    style: titleS,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wind,
                    style: infoS,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    humidity,
                    style: infoS,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pressure:",
                    style: titleS,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Feels Like:",
                    style: titleS,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pressure,
                    style: infoS,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    feels_like,
                    style: infoS,
                  )
                ],
              ),
            ],
          )
        ]),
  );
}
