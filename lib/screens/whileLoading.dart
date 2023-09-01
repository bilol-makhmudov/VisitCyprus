import 'package:flutter/material.dart';

class WhileLoadingScreen extends StatefulWidget {
  const WhileLoadingScreen({Key? key}) : super(key: key);

  static const String routeName = "/loading";

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => WhileLoadingScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  State<WhileLoadingScreen> createState() => _WhileLoadingScreenState();
}

class _WhileLoadingScreenState extends State<WhileLoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 50),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Image.asset("assets/LOGOBLACK.png")

            Image.asset("assets/innerCircle.png", fit: BoxFit.fill),

            RotationTransition(
              turns: _animationController,
              filterQuality: FilterQuality.high,
              child: Image.asset("assets/outerCircle.png", fit: BoxFit.fill),
            ),
          ],
        ),
      ),
    );
  }
}
