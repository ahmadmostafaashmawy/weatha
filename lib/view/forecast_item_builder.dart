import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/weather_response.dart';
import 'package:weather/utilities/app_color.dart';
import 'package:weather/widgets/text_display.dart';

class ForecastItemBuilder extends StatelessWidget {
  const ForecastItemBuilder(
    this.weatherResponse, {
    Key key,
  }) : super(key: key);
  final WeatherResponse weatherResponse;

  @override
  Widget build(BuildContext context) {
    DateTime date =
        DateFormat("yyyy-MM-dd hh:mm:ss").parse(weatherResponse.dtTxt);
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextDisplay(
            text: "${date.day} / ${date.month}",
            fontSize: 16,
            color: AppColor.LightBlue,
          ),
          AppTextDisplay(
            text: "${date.hour} : ${date.minute}",
            fontSize: 16,
            color: AppColor.LightBlue,
          ),
          AppTextDisplay(
            text: weatherResponse.weather[0].description,
            fontSize: 14,
            color: AppColor.LightBlue,
          ),
          AppTextDisplay(
            text: "${weatherResponse.main.temp}°",
            fontSize: 14,
            color: AppColor.Blue,
          ),
        ],
      ),
    );
  }
}
