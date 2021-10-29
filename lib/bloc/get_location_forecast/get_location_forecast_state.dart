import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather/model/forecast_response.dart';

abstract class FetchLocationForecastState extends Equatable {
  const FetchLocationForecastState();

  @override
  List<Object> get props => [];
}

class GetLocationUninitialized extends FetchLocationForecastState {}

class GetLocationLoading extends FetchLocationForecastState {}

class GetLocationSuccess extends FetchLocationForecastState {
  final ForecastResponse locationForecast;

  const GetLocationSuccess({@required this.locationForecast});

  @override
  List<Object> get props => [locationForecast];
}

class GetLocationFailed extends FetchLocationForecastState {
  final String error;

  const GetLocationFailed({@required this.error});

  @override
  List<Object> get props => [error];
}
