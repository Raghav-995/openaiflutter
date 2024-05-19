
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:openaiflutter/openai/key.dart';

class OpenAIServices {
  final dio = Dio();
  final List<Map<String, String>> messages = [];

  Future<String> isArtPromtAPI(String prompt) async {
    try {
      final res = await dio.post(
        'https://api.openai.com/v1/chat/completions',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $openAIAPIKey',
          },
        ),
        data: jsonEncode({
          "model": "gpt-3.5-turbo-16k",
          "messages": [
            {
              'role': 'user',
              'content':
                  'Does this message want to generate an AI picture, image, art or anything similar? $prompt . Simply answer with a yes or no.',
            }
          ],
        }),
      );
      print(res.data);
      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.data)['choices'][0]['message']['content'];
        content = content.trim();

        switch (content) {
          case 'Yes':
          case 'yes':
          case 'Yes.':
          case 'yes.':
            final res = await dallEAPI(prompt);
            print(res);
            return res;
          default:
            final res = await chatGPTAPI(prompt);
            return res;
        }
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> chatGPTAPI(String prompt) async {
    messages.add({
      'role': 'user',
      'content': prompt,
    });
    try {
      final res = await dio.post(
        'https://api.openai.com/v1/chat/completions',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $openAIAPIKey',
          },
        ),
        data: jsonEncode({
          "model": "gpt-3.5-turbo-16k",
          "messages": messages,
        }),
      );

      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.data)['choices'][0]['message']['content'];
        content = content.trim();

        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return content;
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> dallEAPI(String prompt) async {
    messages.add({
      'role': 'user',
      'content': prompt,
    });
    try {
      final res = await dio.post(
        'https://api.openai.com/v1/images/generations',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $openAIAPIKey',
          },
        ),
        data: jsonEncode({
          'prompt': prompt,
          'n': 1,
        }),
      );

      if (res.statusCode == 200) {
        String imageUrl = jsonDecode(res.data)['data'][0]['url'];
        imageUrl = imageUrl.trim();

        messages.add({
          'role': 'assistant',
          'content': imageUrl,
        });
        return imageUrl;
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }
}
