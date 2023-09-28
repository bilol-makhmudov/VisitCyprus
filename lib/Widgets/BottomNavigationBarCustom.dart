import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  final int currentPage;
  final Function onPageChanged;
  const BottomNavigationBarCustom(
      {super.key, required this.onPageChanged, required this.currentPage});

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Theme(
        data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).primaryColorDark,
                    ),
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: Icon(Icons.horizontal_rule,
                                  size: 30,
                                  color: pageIndex == 0
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).primaryColorDark),
                            ),
                            Expanded(
                              child: IconButton(
                                  enableFeedback: false,
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    pageIndex = 0;
                                    widget.onPageChanged(pageIndex);
                                  },
                                  icon: pageIndex == 0
                                      ? Icon(
                                          Icons.home_filled,
                                          color: Theme.of(context).primaryColor,
                                          size: 30,
                                        )
                                      : Icon(
                                          Icons.home_outlined,
                                          color: Theme.of(context).primaryColor,
                                          size: 30,
                                        )),
                            ),
                            Expanded(
                              child: Icon(Icons.horizontal_rule,
                                  size: 30,
                                  color: pageIndex == 0
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).primaryColorDark),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Expanded(
                              child: Icon(Icons.horizontal_rule,
                                  size: 30,
                                  color: pageIndex == 1
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).primaryColorDark),
                            ),
                            Expanded(
                              child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    pageIndex = 1;
                                    widget.onPageChanged(pageIndex);
                                  },
                                  icon: pageIndex == 1
                                      ? Icon(
                                          Icons.location_on,
                                          color: Theme.of(context).primaryColor,
                                          size: 30,
                                        )
                                      : Icon(
                                          Icons.location_on_outlined,
                                          color: Theme.of(context).primaryColor,
                                          size: 30,
                                        )),
                            ),
                            Expanded(
                              child: Icon(Icons.horizontal_rule,
                                  size: 30,
                                  color: pageIndex == 1
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).primaryColorDark),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Expanded(
                              child: Icon(Icons.horizontal_rule,
                                  size: 30,
                                  color: pageIndex == 2
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).primaryColorDark),
                            ),
                            Expanded(
                              child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    pageIndex = 2;
                                    widget.onPageChanged(pageIndex);
                                  },
                                  icon: pageIndex == 2
                                      ? Icon(
                                          Icons.message,
                                          color: Theme.of(context).primaryColor,
                                          size: 30,
                                        )
                                      : Icon(
                                          Icons.message_outlined,
                                          color: Theme.of(context).primaryColor,
                                          size: 30,
                                        )),
                            ),
                            Expanded(
                              child: Icon(Icons.horizontal_rule,
                                  size: 30,
                                  color: pageIndex == 2
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).primaryColorDark),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Expanded(
                              child: Icon(Icons.horizontal_rule,
                                  size: 30,
                                  color: pageIndex == 3
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).primaryColorDark),
                            ),
                            Expanded(
                              child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    pageIndex = 3;
                                    widget.onPageChanged(pageIndex);
                                  },
                                  icon: pageIndex == 3
                                      ? Icon(
                                          Icons.person,
                                          color: Theme.of(context).primaryColor,
                                          size: 30,
                                        )
                                      : Icon(
                                          Icons.person_outline,
                                          color: Theme.of(context).primaryColor,
                                          size: 30,
                                        )),
                            ),
                            Expanded(
                              child: Icon(Icons.horizontal_rule,
                                  size: 30,
                                  color: pageIndex == 3
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).primaryColorDark),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
