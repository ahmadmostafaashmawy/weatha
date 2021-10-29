import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/model/weather_response.dart';
import 'package:weather/repo/fetch_city_forecast.dart';

import 'get_city_forecast_event.dart';
import 'get_city_forecast_state.dart';

class FetchCityForecastBLoc extends Bloc<FetchCityForecastEvent, FetchCityForecastState> {
  FetchCityForecastBLoc() : super(GetCityUninitialized());
  List<WeatherResponse> list = [];

  @override
  Stream<FetchCityForecastState> mapEventToState(
      FetchCityForecastEvent event) async* {
    if (event is FetchEvent) {
      yield* getCitiesForecast(event);
    }
  }

  Stream<FetchCityForecastState> getCitiesForecast(FetchEvent event) async* {
    try {
      yield GetCityLoading();
      List<WeatherResponse> results = await Future.wait([
        for (String city in event.cities)
          FetchCityForecastRepository.fetchCityForecast(city),
      ]);

      if (results != null) {
        list = results;
        yield GetCitySuccess(citiesForecast: list);
      } else {
        yield GetCityFailed(error: "Error getting forecast");
      }
    } catch (e) {
      print(e.toString());
      yield GetCityFailed(error: e.toString());
    }
  }
}
