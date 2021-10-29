import 'package:dio/dio.dart';

class ApiService {
  static const String appID = "appid=";
  static const String appIdValue = "b2a9a6289b0ef3f55683f2647add96ae";
  static const String unites = "&units=";
  static const String unitesValue = "metric";
  static const String city = "q=";
  static const String lat = "&lat=";
  static const String lon = "&lon=";
  static const String baseUrl = "http://api.openweathermap.org/data/2.5/";

  static Future<Response<T>> getApi<T>(String path,
      {String cityName, String longitude, String latitude}) async {
    Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
    Response response = await dio.get(path +
        (cityName != null ? (city + cityName + "&") : "") +
        appID +
        appIdValue +
        unites +
        unitesValue +
        (latitude != null ? (lat + latitude) : "") +
        (longitude != null ? (lon + longitude) : ""));

    return response;
  }
}
