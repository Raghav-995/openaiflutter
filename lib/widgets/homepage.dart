import 'package:flutter/material.dart';
import 'package:openaiflutter/widgets/featurebox.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key, this.gContent, this.gUrl});
  final String? gContent;
  final String? gUrl;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(height: 4.0),
          Stack(
            children: [
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('images/chat.jpg')),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(16.0).copyWith(topLeft: Radius.zero),
                border: Border.all(
                    color: Theme.of(context).colorScheme.inversePrimary)),
            child: Text(
              gContent == null
                  ? 'Good Morning, How can I help You!!, Any Task for me to Complete for today'
                  : gContent!,
              style: gContent == null
                  ? Theme.of(context).textTheme.titleLarge
                  : Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 16.0),
            ),
          ),
          Visibility(
            visible: gContent == null,
            child: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 15.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Here are a New Features!',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Visibility(
            visible: gContent == null,
            child: Column(
              children: [
                FeatureBox(
                  color: Theme.of(context).colorScheme.primary,
                  heading: 'ChatGPT',
                  description:
                      'A smarter way to stay organized,informed solving queries with ChatGPT-3',
                ),
                FeatureBox(
                  color: Theme.of(context).colorScheme.onSecondary,
                  heading: 'Dalle-E',
                  description:
                      'Get inspired and stay creative with your personal assistant powered by Dall-E',
                ),
                FeatureBox(
                  color: Theme.of(context).colorScheme.primary,
                  heading: 'Smart Voice Assistant',
                  description:
                      'Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
