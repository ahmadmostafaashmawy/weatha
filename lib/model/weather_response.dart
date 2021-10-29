import 'package:weather/model/main_weather.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/model/wind.dart';

class WeatherResponse {
  List<Weather> weather;
  String base;
  Main main;
  Wind wind;
  String name;
  String dtTxt;

  WeatherResponse({
    this.weather,
    this.base,
    this.main,
    this.wind,
    this.name,
    this.dtTxt,
  });

  WeatherResponse.fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    name = json['name'];
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (weather != null) {
      data['weather'] = weather.map((v) => v.toJson()).toList();
    }
    data['base'] = base;
    if (main != null) {
      data['main'] = main.toJson();
    }
    data['dt_txt'] = this.dtTxt;
    data['name'] = name;
    return data;
  }
}
