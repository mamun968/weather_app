class Weather {
   final String cityName;
  final String description;
  final double temp;
  final double wind;
  final int humidity;
 final  double feels_like;
  final int pressure;
  final String icon;

  
  Weather({required this.cityName, required this.temp, required this.wind, required this.humidity, required this.feels_like,
      required this.pressure, required this.icon, required this.description,} );

 factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
    cityName : json["name"],
    description :json["weather"][0]["description"],
    temp :json["main"]["temp"],
    wind : json["main"]["wind_speed"],
    humidity : json["main"]["humidity"],
    feels_like : json["main"]["feels_like"],
    pressure : json["main"]["pressure"],
    icon : json["weather"][0]["icon"],
    );
  }
}
