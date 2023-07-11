import 'dart:async';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:weather_app/client/weather_api.dart';
import 'package:weather_app/modal/weather_model.dart';
import 'package:weather_app/views/additional_information.dart';
import 'package:weather_app/views/current_weather.dart';

import 'modal/iconData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  String city = "dhaka";
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    setState(() {
      _currentTime = DateTime.now();
    });
  }

  var locationController = TextEditingController();
  Future<void> getdata() async {
    data = await client.getCurrentWeather(city)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 99, 9, 216),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 99, 9, 216),
          elevation: 0,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          centerTitle: true,
          title: const Text("Weather App"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          ],
        ),
        body: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (data!.icon != null)
                    Icon(
                      getIconData(data!.icon!),
                      size: 50,
                      color: Colors.amber,
                    ),
                  currentWeather("${data!.temp!.toStringAsFixed(0)}\u00B0C",
                      "${data!.cityName}"),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${data!.description}".toUpperCase(),
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Update Time: ${_currentTime.hour.toString().padLeft(2, '0')}:'
                    '${_currentTime.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    "Additional Information",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  additionalInformation(
                      "${data!.wind} km/h",
                      "${data!.humidity}%",
                      "${data!.pressure} hPa",
                      "${data!.feelsLike!.toStringAsFixed(0)}\u00B0C"),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: locationController,
                    decoration: InputDecoration(
                        labelText: "Write Your City",
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        fillColor: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      city = locationController.text.trim();
                      setState(() {});
                      locationController.clear();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black,
                      ),
                      height: 30,
                      width: 150,
                      child: const Center(
                        child: Text(
                          "Search Your Weather",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ));
  }
}
