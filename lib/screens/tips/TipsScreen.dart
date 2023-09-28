import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  static const String routeName = "/tips";

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => TipsScreen(), settings: RouteSettings(name: routeName));
  }

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
