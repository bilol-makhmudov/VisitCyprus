import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  static const String routeName = "/map";

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => MapScreen(), settings: RouteSettings(name: routeName));
  }

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
