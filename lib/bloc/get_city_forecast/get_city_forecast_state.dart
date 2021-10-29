import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather/model/weather_response.dart';

abstract class FetchCityForecastState extends Equatable {
  const FetchCityForecastState();

  @override
  List<Object> get props => [];
}

class GetCityUninitialized extends FetchCityForecastState {}

class GetCityLoading extends FetchCityForecastState {}

class GetCitySuccess extends FetchCityForecastState {
  final List<WeatherResponse> citiesForecast;

  GetCitySuccess({@required this.citiesForecast});

  @override
  List<Object> get props => [citiesForecast];
}

class GetCityFailed extends FetchCityForecastState {
  final String error;

  GetCityFailed({@required this.error});

  @override
  List<Object> get props => [error];
}
