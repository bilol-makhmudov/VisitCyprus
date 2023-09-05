import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:visit_cyprus/screens/welcome/welcome_screen.dart';
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
      theme: theme(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('tr', 'TR'),
        Locale('uz', 'UZ'),
        Locale('ru', 'RU')
      ],
      onGenerateRoute: AppRoute.onGenerateRoute,
      initialRoute: WelcomeScreen.routeName,
      home: WelcomeScreen(),
    );
  }
}
