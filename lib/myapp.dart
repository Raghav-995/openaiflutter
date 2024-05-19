import 'package:flutter/material.dart';
import 'package:openaiflutter/openai/openai.dart';
import 'package:openaiflutter/widgets/homepage.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final speechToText = SpeechToText();
  String lastwords = '';
  final OpenAIServices openai = OpenAIServices();
  FlutterTts flutterTts = FlutterTts();
  String? generatedUrl;
  String? generatedContent;

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  Future<void> initSpeech() async {
    await speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastwords = result.recognizedWords;
    });
  }

  Future<void> systemSpeak(String content) async {
    await flutterTts.speak(content);
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'OpenAI with Flutter',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 100.0,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.tertiary,
                  ]),
                ),
                child: Center(
                  child: Text(
                    'Chat-GPT 3.0',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.error),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Homepage(
        gContent: generatedContent,
        gUrl: generatedUrl,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
            onPressed: () async {
              if (await speechToText.hasPermission &&
                  speechToText.isNotListening) {
                await startListening();
              }
              if (speechToText.isListening) {
                final speech = await openai.isArtPromptAPI(lastwords);
                if (speech.contains('https:')) {
                  generatedContent = null;
                  generatedUrl = speech;
                  setState(() {});
                } else {
                  generatedContent = speech;
                  generatedUrl = null;
                  setState(() {});
                  await systemSpeak(speech);
                }

                await stopListening();
              } else {
                initSpeech();
              }
            },
            icon: const Icon(Icons.mic)),
      ),
    );
  }
}
