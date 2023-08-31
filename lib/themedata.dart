import 'package:flutter/material.dart';

final themedata = ThemeData(
    iconTheme: IconThemeData(color: Colors.purple),
    primarySwatch: MaterialColor(0xff880808, <int, Color>{
      50: Colors.purple.shade50,
      100: Colors.purple.shade100,
      200: Colors.purple.shade200,
      300: Colors.purple.shade300,
      400: Colors.purple.shade400,
      500: Colors.purple.shade500,
      600: Colors.purple.shade600,
      700: Colors.purple.shade700,
      800: Colors.purple.shade800,
      900: Colors.purple.shade900,
    }),
    appBarTheme: AppBarTheme(
        backgroundColor: MaterialColor(0xff880808, {
      900: Colors.purple.shade500,
    })),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: MaterialColor(0xff880808, {
      900: Colors.purple.shade500,
    })));
