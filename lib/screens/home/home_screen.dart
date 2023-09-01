import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => HomeScreen(), settings: RouteSettings(name: routeName));
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("HOME"),
            Text("Wonderful North Cyprus",
                style: Theme.of(context).textTheme.displayLarge),
            Center(
              child: TextButton(
                child: Text("Go to Welcome Page"),
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
