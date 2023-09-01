import 'package:flutter/material.dart';
import 'package:visit_cyprus/screens/welcome/welcome_screen.dart';
import 'package:visit_cyprus/screens/whileLoading.dart';
import 'config/app_router.dart';
import 'config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: WelcomeScreen(),
      onGenerateRoute: AppRoute.onGenerateRoute,
      initialRoute: WelcomeScreen.routeName,
    );
  }
}
