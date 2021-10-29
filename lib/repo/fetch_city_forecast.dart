import 'package:weather/api/api_service.dart';
import 'package:weather/model/forecast_response.dart';
import 'package:weather/model/weather_response.dart';

class FetchCityForecastRepository {
  static Future<WeatherResponse> fetchCityForecast(String city) async {
    var response = await ApiService.getApi('weather?', cityName: city);
    print(response.data);
    return WeatherResponse.fromJson(response.data);
  }

  static Future<ForecastResponse> fetchLocationForecast(
      String long, String lat) async {
    var response =
        await ApiService.getApi('forecast?', latitude: lat, longitude: long);
    print(response.data);
    return ForecastResponse.fromJson(response.data);
  }
}
