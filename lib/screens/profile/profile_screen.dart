import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = "/profile";

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => ProfileScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
