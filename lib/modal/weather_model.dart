class Weather {
  String? cityName;
  String? description;
  double? temp;
  double? wind;
  int? humidity;

  double? feelsLike;
  int? pressure;
  String? icon;

  Weather({
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.feelsLike,
    this.pressure,
    this.icon,
    this.description,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    description = json["weather"][0]["description"];
    temp = json["main"]["temp"] ;
    wind = json["wind"]["speed"];
    humidity = json["main"]["humidity"];
    feelsLike = json["main"]["feels_like"] ;
    pressure = json["main"]["pressure"];
    icon = json["weather"][0]["icon"];
  }
}
