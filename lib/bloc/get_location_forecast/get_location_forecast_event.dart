import 'package:equatable/equatable.dart';

abstract class FetchLocationForecastEvent extends Equatable {
  const FetchLocationForecastEvent();

  @override
  List<Object> get props => [];
}

class FetchForecastEvent extends FetchLocationForecastEvent {
  final String long;
  final String lat;

  const FetchForecastEvent({this.long, this.lat});

  @override
  List<Object> get props => [];
}
