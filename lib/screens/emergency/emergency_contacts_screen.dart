import 'package:flutter/material.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  static const String routeName = "/emergency";

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => EmergencyScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
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
