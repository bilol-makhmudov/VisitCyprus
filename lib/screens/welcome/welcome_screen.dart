import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visit_cyprus/screens/whileLoading.dart';

import '../../Widgets/chooseLanguageMenu.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/";

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => WelcomeScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String selectedLanguage = "English";
  bool showChooseLanguageMenu = false;
  bool showLoadingPage = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Future.delayed(Duration(milliseconds: 2500), () {
      setState(() {
        showLoadingPage = false;
      });
    });
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/cyprusbeach.jpg"),
                    fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: height * 0.5,
                      width: width * 0.95,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).primaryColor),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            Text(
                              "Discover best places to visit in North Cyprus",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "RaleWay",
                                  color: Theme.of(context).primaryColorDark),
                            ),
                            Text(
                              "Use the best travel guide to Turkish Republic of North Cyprus",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                              ),
                            ),
                            Row(children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll<Color>(
                                                Theme.of(context)
                                                    .primaryColorDark),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(context, "/map");
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          "Get Started",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      )),
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(visible: showLoadingPage, child: WhileLoadingScreen()),
        ],
      ),
    );
  }
}
