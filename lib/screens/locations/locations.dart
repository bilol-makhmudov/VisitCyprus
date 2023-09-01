import 'package:flutter/material.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({Key? key}) : super(key: key);

  static const String routeName = "/locations";

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => LocationsScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text("Go to Welcome Page"),
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
        ),
      ),
    );
  }
}
