import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Center(
              child: Container(
                height: 120,
                width: 120,
                margin: const EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ),
            Container(
              height: 123,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('images/chat.jpg')),
              ),
            ),
            Text('hhll')
          ],
        )
      ],
    );
  }
}
