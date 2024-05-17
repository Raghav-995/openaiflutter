import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  primary: const Color.fromRGBO(69, 222, 242, 0.733),
  secondary: const Color.fromRGBO(182, 40, 234, 0.725),
  tertiary: const Color.fromRGBO(240, 148, 9, 0.733),
  error: const Color.fromRGBO(230, 4, 4, 0.733),
  onSecondary: const Color.fromARGB(209, 168, 162, 244),
  onTertiary: const Color.fromRGBO(252, 252, 15, 0.725),
  seedColor: const Color.fromRGBO(67, 234, 34, 0.735),
);
var darkColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(207, 124, 66, 240));

ThemeMode mode = ThemeMode.system;

ThemeData themeLight = ThemeData().copyWith(
  colorScheme: kColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kColorScheme.primary,
  ),
  drawerTheme: DrawerThemeData(backgroundColor: kColorScheme.primary),
  scaffoldBackgroundColor: kColorScheme.onPrimary,
  cardTheme: const CardTheme().copyWith(
    color: kColorScheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kColorScheme.primary,
    ),
  ),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: kColorScheme.primary),
  textTheme: ThemeData().textTheme.copyWith(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: kColorScheme.onSecondaryContainer,
        fontSize: 20,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: kColorScheme.onSecondaryContainer,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: kColorScheme.onSecondaryContainer,
      )),
  iconTheme: IconThemeData(color: kColorScheme.onPrimary),
);

ThemeData themeDark = ThemeData.dark().copyWith(
  colorScheme: darkColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: darkColorScheme.primary,
  ),
  scaffoldBackgroundColor: kColorScheme.secondary,
  cardTheme: const CardTheme().copyWith(
    color: darkColorScheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkColorScheme.primaryContainer,
      foregroundColor: darkColorScheme.onPrimaryContainer,
    ),
  ),
);
