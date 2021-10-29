import 'package:flutter/material.dart';
import 'package:weather/model/weather_response.dart';
import 'package:weather/utilities/app_color.dart';
import 'package:weather/utilities/app_images.dart';

import 'components_widgets/size.dart';
import 'components_widgets/text_display.dart';

class CityForecastBuilder extends StatelessWidget {
  final WeatherResponse cityForecast;

  const CityForecastBuilder({
    Key key,
    @required this.cityForecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.BlueLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: GridTile(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCityNameText(),
            HeightBox(8),
            buildWeatherDescription(),
            HeightBox(4),
            buildMaxTemp(),
            HeightBox(4),
            buildMinTemp(),
            HeightBox(4),
            buildWindSpeed(),
            HeightBox(4),
            buildHumidity(),
          ],
        ),
      ),
    );
  }

  Widget buildHumidity() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(AppImages.humidityIcon,
            height: 22, color: AppColor.Blue),
        AppTextDisplay(
            text: "Humidity: ${cityForecast.main.humidity}",
            color: AppColor.LightBlue,
            fontSize: 14),
      ],
    );
  }

  Widget buildWindSpeed() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(AppImages.windIcon, height: 22, color: AppColor.Blue),
        AppTextDisplay(
            text: "Wind Speed: ${cityForecast.wind.speed}",
            color: AppColor.LightBlue,
            fontSize: 14),
      ],
    );
  }

  Widget buildMinTemp() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(AppImages.moonIcon, height: 22, color: AppColor.Blue),
        AppTextDisplay(
            text: "Min Temp: ${cityForecast.main.tempMin}°",
            color: AppColor.LightBlue,
            fontSize: 14),
      ],
    );
  }

  Widget buildMaxTemp() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(AppImages.sunIcon, height: 22, color: AppColor.Blue),
        AppTextDisplay(
            text: "Max Temp: ${cityForecast.main.tempMax}°",
            color: AppColor.LightBlue,
            fontSize: 14),
      ],
    );
  }

  Widget buildWeatherDescription() {
    return AppTextDisplay(
        text: cityForecast.weather[0].description,
        color: AppColor.BlueThird,
        fontSize: 14);
  }

  Widget buildCityNameText() {
    return AppTextDisplay(
      text: cityForecast.name,
      color: AppColor.DarkBlue,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }
}
