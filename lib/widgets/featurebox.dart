import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  const FeatureBox(
      {super.key,
      required this.heading,
      required this.description,
      required this.color});
  final String heading;
  final String description;
  final Color color;
  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0), color: color),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            const SizedBox(height: 4.0),
            Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
