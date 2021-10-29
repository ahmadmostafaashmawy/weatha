import 'package:weather/view/current_city_forecast_screen.dart';
import 'package:weather/view/home_screen.dart';
import 'package:weather/view/splash_screen.dart';

class AppRoute {
  static const splashScreen = '/';
  static const homeScreen = '/home';
  static const currentCityForecastScreen = '/currentCityForecastScreen';
}

var routes = {
  AppRoute.splashScreen: (context) => const SplashScreen(),
  AppRoute.homeScreen: (context) => const HomeScreen(),
  AppRoute.currentCityForecastScreen: (context) => const CurrentCityForecastScreen(),
};
