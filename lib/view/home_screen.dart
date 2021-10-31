import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/get_city_forecast/get_city_forecast_bloc.dart';
import 'package:weather/bloc/get_city_forecast/get_city_forecast_event.dart';
import 'package:weather/bloc/get_city_forecast/get_city_forecast_state.dart';
import 'package:weather/model/weather_response.dart';
import 'package:weather/routes.dart';
import 'package:weather/utilities/app_color.dart';
import 'package:weather/utilities/app_edit_validator.dart';
import 'package:weather/utilities/app_images.dart';
import 'package:weather/utilities/localization/localization_constains.dart';
import 'package:weather/utilities/navigator.dart';
import 'package:weather/view/city_forecast_builder.dart';
import 'package:weather/view/home_header.dart';
import 'package:weather/widgets/button_display.dart';
import 'package:weather/widgets/loading.dart';
import 'package:weather/widgets/size.dart';
import 'package:weather/widgets/snak_bar.dart';
import 'package:weather/widgets/text_display.dart';
import 'package:weather/widgets/text_field_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var formKey = GlobalKey<FormState>();
  var citiesEditTextController = TextEditingController();
  List<WeatherResponse> citiesForecast = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FetchCityForecastBLoc(),
      child: Scaffold(
        backgroundColor: AppColor.BackgroundColor,
        body: Form(
          key: formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeHeader(
                    iconPath: AppImages.forecastCurrentLocationIcon,
                    onClick: () =>
                        pushName(context, AppRoute.currentCityForecastScreen),
                  ),
                  buildTextHeader(),
                  WidthBox(4),
                  buildCities(),
                  if (citiesForecast.isNotEmpty) buildCitiesList()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCities() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: AppEditText(
            text: "Ex: Cairo, Berlin, New York",
            controller: citiesEditTextController,
            validator: (value) => validatorStringRequired(value, context),
          )),
          WidthBox(8),
          buildButtonConsumer()
        ],
      ),
    );
  }

  Widget buildButtonConsumer() {
    return BlocConsumer<FetchCityForecastBLoc, FetchCityForecastState>(
        listener: fetchForecastListener,
        builder: (context, state) {
          return state is GetCityLoading
              ? LoadingWidget()
              : buildAppButton(context);
        });
  }

  Widget buildAppButton(BuildContext context) {
    return AppButton(
        translation: kGet,
        onTap: () {
          if (!formKey.currentState.validate()) {
            return;
          }
          List<String> cities = [];
          List<String> str = citiesEditTextController.text.split(',');
          for (String cityName in str) {
            if (RegExp(r'^[a-zA-Z ]+$')
                .hasMatch(cityName.trimLeft().trimRight())) {
              cities.add(cityName);
            }
          }
          if (cities.isNotEmpty) {
            BlocProvider.of<FetchCityForecastBLoc>(context)
                .add(FetchEvent(cities));
          } else {
            showSnackBar(context, "You have to type a right city name");
          }
        });
  }

  void fetchForecastListener(
      BuildContext context, FetchCityForecastState state) {
    if (state is GetCitySuccess) {
      setState(() => citiesForecast = state.citiesForecast);
    } else if (state is GetCityFailed) {
      showSnackBar(
          context,
          state.error != null || state.error != "null"
              ? state.error
              : "Error!");
      // print(state.error);
    }
  }

  Widget buildTextHeader() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: AppTextDisplay(
          translation: kEnterCities,
          textAlign: TextAlign.start,
          color: AppColor.DarkBlue,
        ),
      ),
    );
  }

  Widget buildCitiesList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: citiesForecast.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return CityForecastBuilder(cityForecast: citiesForecast[index]);
        },
      ),
    );
  }
}
