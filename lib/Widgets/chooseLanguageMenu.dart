import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseLanguageMenu extends StatefulWidget {
  Function chosenLanguageChanged;
  ChooseLanguageMenu({
    super.key,
    required this.chosenLanguageChanged,
  });

  @override
  State<ChooseLanguageMenu> createState() => _ChooseLanguageMenuState();
}

class _ChooseLanguageMenuState extends State<ChooseLanguageMenu> {
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          border:
              Border.all(color: Theme.of(context).primaryColorDark, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildLanguageItem("English", "ukFlag.png"),
            buildLanguageItem("Türkçe", "turkeyFlag.png"),
            buildLanguageItem("O'zbekcha", "uzbekistanFlag.png"),
            buildLanguageItem("Russian", "russiaFlag.jpg"),
          ],
        ),
      ),
    );
  }

  Widget buildLanguageItem(String language, String flagAsset) {
    return Visibility(
      visible: selectedLanguage == language || selectedLanguage == null,
      child: InkWell(
        onTap: () {
          setState(() {
            widget.chosenLanguageChanged(language, false);
            selectedLanguage = selectedLanguage == language ? null : language;
          });
        },
        child: Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  child: Image.asset(
                    "assets/$flagAsset",
                  ),
                  radius: 15,
                ),
              ),
              Text(
                language,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
