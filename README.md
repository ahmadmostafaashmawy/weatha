# Weatha Project

A boilerplate project created in flutter using Bloc. Weatha can be runned on Android and ios.


## Getting Started

The Weatha is weather forecast application, you can fetch forecast for multiple cities and fetch forecast for your location and check weather for 5 days.

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/ahmadmostafaashmawy/weatha.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
cd my_app
flutter analyze
flutter test
flutter pub get
flutter run lib/main.dart
```

## Boilerplate Features:

* Splash
* Home
* Current Location Forecast
* Routing
* Theme
* Dio
* Bloc (State Management)

### Libraries & Tools Used

* [Dio](https://github.com/flutterchina/dio)
* [Bloc](https://github.com/felangel/bloc/tree/master/packages/flutter_bloc) (State Management)
* [GeoLocator](https://github.com/Baseflow/flutter-geolocator/tree/master/geolocator)
* [ScreenUtil](https://github.com/OpenFlutter/flutter_screenutil)
* [Equatable](https://github.com/felangel/equatable)


### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- assets
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- api/
|- bloc/
|- model/
|- repo/
|- utils/
|- view/
|- widgets/
|- main.dart
|- routes.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- api - contains api service class that is used for getting data from apis.
2- bloc - Contains bloc floders.
3- stores - Contains store(s) for state-management of your application, to connect the reactive data of your application with the UI.
4- model — Contains all models of project that is get from apis and to viewed on the screens.
5- repo — Contains the repos of project that is used by bloc.
6- util — Contains the utilities/common functions of your application.
7- routes.dart — This file contains all the routes for your application.
8- main.dart - This is the starting point of the application. All the application level
9-widgets — Contains the common widgets for your applications. For example, Button, TextField etc.
configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

## Wiki

Checkout [wiki](https://github.com/zubairehman/flutter-boilerplate-project/wiki) for more info

## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the boilerplate then please feel free to submit an issue and/or pull request 🙂

Again to note, this is example can appear as over-architectured for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.

