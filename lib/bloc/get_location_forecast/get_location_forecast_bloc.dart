import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/model/forecast_response.dart';
import 'package:weather/repo/fetch_city_forecast.dart';

import 'get_location_forecast_event.dart';
import 'get_location_forecast_state.dart';

class FetchLocationForecastBLoc
    extends Bloc<FetchLocationForecastEvent, FetchLocationForecastState> {
  FetchLocationForecastBLoc() : super(GetLocationUninitialized());
  ForecastResponse forecastResponse;

  @override
  Stream<FetchLocationForecastState> mapEventToState(
      FetchLocationForecastEvent event) async* {
    if (event is FetchForecastEvent) {
      yield* getCitiesForecast(event);
    }
  }

  Stream<FetchLocationForecastState> getCitiesForecast(
      FetchForecastEvent event) async* {
    try {
      yield GetLocationLoading();
      ForecastResponse results =
          await FetchCityForecastRepository.fetchLocationForecast(
              event.long, event.lat);

      if (results != null) {
        forecastResponse = results;
        forecastResponse.weatherResponse
            .sort((a, b) => a.dtTxt.compareTo(b.dtTxt));
        yield GetLocationSuccess(locationForecast: forecastResponse);
      } else {
        yield const GetLocationFailed(error: "Error getting forecasts");
      }
    } catch (e) {
      print(e.toString());
      yield GetLocationFailed(error: e.toString());
    }
  }
}
