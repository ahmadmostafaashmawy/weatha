import 'package:weather/model/city_response.dart';
import 'package:weather/model/weather_response.dart';

class ForecastResponse {
  String cod;
  int message;
  int cnt;
  List<WeatherResponse> weatherResponse;
  City city;

  ForecastResponse({this.cod, this.message, this.cnt, this.weatherResponse, this.city});

  ForecastResponse.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      weatherResponse = [];
      json['list'].forEach((v) {
        weatherResponse.add(WeatherResponse.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    if (weatherResponse != null) {
      data['list'] = weatherResponse.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      data['city'] = city.toJson();
    }
    return data;
  }
}
