import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  static const String routeName = "/details";

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => DetailsScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
