import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../Widgets/PreviewCard.dart';

class EverythingScreen extends StatefulWidget {
  const EverythingScreen({
    super.key,
  });

  @override
  State<EverythingScreen> createState() => _EverythingScreenState();
}

class _EverythingScreenState extends State<EverythingScreen> {
  late ScrollController _restaurantsController;
  late ScrollController _historicalController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _restaurantsController = ScrollController();
    _historicalController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _restaurantsController.dispose();
    _historicalController.dispose();
  }

  void scrollLeft(ScrollController controller) {
    // Calculate the new scroll offset to move by a certain amount (adjust as needed)
    final double offsetToScroll = controller.offset - 200.0;

    // Scroll to the new offset with an animation
    controller.animateTo(
      offsetToScroll,
      duration: Duration(milliseconds: 500), // Adjust the duration as needed
      curve: Curves.easeInOut, // Adjust the curve as needed
    );
  }

  void scrollRight(ScrollController controller) {
    // Calculate the new scroll offset to move by a certain amount (adjust as needed)
    final double offsetToScroll = controller.offset + 200.0;

    // Scroll to the new offset with an animation
    controller.animateTo(
      offsetToScroll,
      duration: Duration(milliseconds: 500), // Adjust the duration as needed
      curve: Curves.easeInOut, // Adjust the curve as needed
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text("Wonderful Cyprus",
                style: Theme.of(context).textTheme.displayLarge),
          ),
          Text("Let's Explore Together",
              style: Theme.of(context).textTheme.displayMedium),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Restaurants",
                      style: Theme.of(context).textTheme.displaySmall),
                ),
                Spacer(),
                IconButton(
                  enableFeedback: false,
                  icon: Icon(Icons.chevron_left),
                  onPressed: () {
                    scrollLeft(_restaurantsController);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.chevron_right),
                  onPressed: () {
                    scrollRight(_restaurantsController);
                  },
                )
              ],
            ),
          ),
          Container(
            height: 250,
            child: ListView.builder(
                controller: _restaurantsController,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PreviewCard(),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Historical places",
                      style: Theme.of(context).textTheme.displaySmall),
                ),
                Spacer(),
                IconButton(
                  enableFeedback: false,
                  icon: Icon(Icons.chevron_left),
                  onPressed: () {
                    scrollLeft(_historicalController);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.chevron_right),
                  onPressed: () {
                    scrollRight(_historicalController);
                  },
                )
              ],
            ),
          ),
          Container(
            height: 250,
            child: ListView.builder(
                controller: _historicalController,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PreviewCard(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
