import 'package:equatable/equatable.dart';

abstract class FetchCityForecastEvent extends Equatable {
  const FetchCityForecastEvent();

  @override
  List<Object> get props => [];
}

class FetchEvent extends FetchCityForecastEvent {
  List<String> cities = [];

  FetchEvent(this.cities);

  @override
  List<Object> get props => [];
}
