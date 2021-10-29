import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/bloc/get_location_forecast/get_location_forecast_bloc.dart';
import 'package:weather/bloc/get_location_forecast/get_location_forecast_event.dart';
import 'package:weather/bloc/get_location_forecast/get_location_forecast_state.dart';
import 'package:weather/model/forecast_response.dart';
import 'package:weather/utilities/app_color.dart';
import 'package:weather/utilities/app_images.dart';
import 'package:weather/utilities/localization/localization_constains.dart';
import 'package:weather/utilities/navigator.dart';
import 'package:weather/view/components_widgets/size.dart';

import 'components_widgets/text_display.dart';
import 'forecast_item_builder.dart';
import 'home_header.dart';

class CurrentCityForecastScreen extends StatefulWidget {
  const CurrentCityForecastScreen({Key key}) : super(key: key);

  @override
  _CurrentCityForecastScreenState createState() =>
      _CurrentCityForecastScreenState();
}

class _CurrentCityForecastScreenState extends State<CurrentCityForecastScreen> {
  bool serviceEnabled = false;

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  getCurrentLocation() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    setState(() {});
    Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best)
        .timeout(Duration(seconds: 5));

    BlocProvider.of<FetchLocationForecastBLoc>(context).add(FetchForecastEvent(
        long: position.longitude.toString(),
        lat: position.latitude.toString()));

    print(position.longitude);
    print(position.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeHeader(
                iconPath: AppImages.backIcon,
                onClick: () => popScreen(context, 1),
              ),
              buildContent()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContent() {
    return (serviceEnabled)
        ? buildForecastProvider()
        : buildPermissionIsRequired();
  }

  Widget buildPermissionIsRequired() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      HeightBox(16),
      Image.asset(AppImages.mapLocation, height: 60, color: AppColor.Blue),
      HeightBox(12),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppTextDisplay(
          translation: kLocationPermissionIsRequired,
          color: AppColor.Blue,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
  }

  Widget buildForecastProvider() {
    return BlocBuilder<FetchLocationForecastBLoc, FetchLocationForecastState>(
        builder: (context, state) {
      if (state is GetLocationLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is GetLocationUninitialized) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is GetLocationFailed) {
        return Center(child: AppTextDisplay(text: "Error: $state"));
      } else if (state is GetLocationSuccess) {
        state.locationForecast.weatherResponse
            .sort((a, b) => a.dtTxt.compareTo(b.dtTxt));

        return buildForecastDetails(state.locationForecast);
      } else {
        return Container();
      }
    });
  }

  Widget buildForecastDetails(ForecastResponse locationForecast) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HeightBox(16),
        AppTextDisplay(
          text:
              "${locationForecast.city.name}, ${locationForecast.city.country}",
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: AppColor.Blue,
        ),
        HeightBox(8),
        GridView.builder(
          shrinkWrap: true,
          itemCount: locationForecast.weatherResponse.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return ForecastItemBuilder(locationForecast.weatherResponse[index]);
          },
        ),
      ],
    );
  }
}
