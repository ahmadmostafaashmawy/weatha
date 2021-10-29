import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/bloc/get_location_forecast/get_location_forecast_bloc.dart';
import 'package:weather/utilities/localization/app_localizations.dart';
import 'bloc/get_city_forecast/get_city_forecast_bloc.dart';
import 'bloc/lang/lang_bloc.dart';
import 'bloc/lang/lang_state.dart';

import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<LanguageBloc>(create: (context) => LanguageBloc()),
    BlocProvider<FetchCityForecastBLoc>(
        create: (context) => FetchCityForecastBLoc()),
    BlocProvider<FetchLocationForecastBLoc>(
        create: (context) => FetchLocationForecastBLoc()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  static String lang = LanguageBloc.ENGLISH;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(builder: (context, state) {
      LanguageBloc languageBloc = BlocProvider.of(context);
      MyApp.lang = languageBloc.lang;

      return ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: () {
            return MaterialApp(
              theme: ThemeData(primarySwatch: Colors.lightBlue),
              debugShowCheckedModeBanner: false,
              routes: routes,
              // initialRoute: AppRoute.Splash,
              supportedLocales: const [
                Locale('ar', 'EG'),
                Locale('en', 'US'),
              ],
              locale: Locale(MyApp.lang),
              localizationsDelegates: const [
                // THIS CLASS WILL BE ADDED LATER
                // A class which loads the translations from JSON files
                AppLocalizations.delegate,
                // Built-in localization of basic text for Material widgets
                GlobalMaterialLocalizations.delegate,
                // Built-in localization for text direction LTR/RTL
                GlobalWidgetsLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate
              ],
            );
          });
    });
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
