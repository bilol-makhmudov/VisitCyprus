import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visit_cyprus/screens/details/location_details_screen.dart';
import 'package:visit_cyprus/screens/emergency/emergency_contacts_screen.dart';
import 'package:visit_cyprus/screens/locations/locations.dart';
import 'package:visit_cyprus/screens/map/map_screen.dart';
import 'package:visit_cyprus/screens/profile/profile_screen.dart';
import 'package:visit_cyprus/screens/whileLoading.dart';

import '../screens/home/home_screen.dart';
import '../screens/welcome/welcome_screen.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    print("The Route is: ${settings.name}");

    switch (settings.name) {
      case '/':
        return WelcomeScreen.route();

      case WelcomeScreen.routeName:
        return WelcomeScreen.route();

      case HomeScreen.routeName:
        return HomeScreen.route();

      case DetailsScreen.routeName:
        return DetailsScreen.route();

      case EmergencyScreen.routeName:
        return EmergencyScreen.route();

      case LocationsScreen.routeName:
        return LocationsScreen.route();

      case MapScreen.routeName:
        return MapScreen.route();

      case ProfileScreen.routeName:
        return ProfileScreen.route();

      case WhileLoadingScreen.routeName:
        return WhileLoadingScreen.route();
        break;
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text("Error: Page doesn't exist"),
              ),
            ),
        settings: RouteSettings(name: "/error"));
  }
}
