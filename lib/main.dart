import 'package:flutter/material.dart';
import 'package:openaiflutter/myapp.dart';
import 'package:openaiflutter/themes/theme.dart';

void main() => runApp(MaterialApp(
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: ThemeMode.system,
      home: const MyApp(),
      debugShowCheckedModeBanner: false,
    ));
