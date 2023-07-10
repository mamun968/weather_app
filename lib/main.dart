import 'package:flutter/material.dart';
import 'package:weather_app/client/weather_api.dart';
import 'package:weather_app/modal/weather_model.dart';
import 'package:weather_app/views/additional_information.dart';
import 'package:weather_app/views/current_weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
  Future<void> getdata() async {
    data = await client.getCurrentWeather("Dhaka")!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
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
            if(snapshot.connectionState==ConnectionState.done){

            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentWeather("${data!.icon}", "${data!.temp}", "${data!.cityName}"),
             const SizedBox(height: 60,),
             const Text("Additional Information" , style: TextStyle(fontSize: 24 , color:Colors.black , fontWeight: FontWeight.bold),),
             const Divider(),
             const SizedBox(height: 20,),
             additionalInformation("${data!.wind}", "${data!.humidity}", "${data!.pressure}", "${data!.feels_like}")
             
             
              ],
            );
          },
        ));
  }
}
