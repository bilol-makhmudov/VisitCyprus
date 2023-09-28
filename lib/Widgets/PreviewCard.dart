import 'package:flutter/material.dart';

class PreviewCard extends StatefulWidget {
  const PreviewCard({super.key});

  @override
  State<PreviewCard> createState() => _PreviewCardState();
}

class _PreviewCardState extends State<PreviewCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(color: Colors.grey, offset: Offset(0.2, 0.5))
      ], borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/sample_restaurant.jpg"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 16),
              child: Text("Sample restaurant",
                  style: Theme.of(context).textTheme.displaySmall),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.orange,
                  ),
                  Text("Alsancak, Kyrenia")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
