import 'package:flutter/material.dart';
import 'package:json_parser/ui/screen/json_parsing_screen.dart';

class JsonParser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JSON Parser',
      home: JsonParsingScreen(),
      theme: lightThemeData(),
    );
  }
}

class AppColors {
  static const Color themeColor = Colors.green;
  static const Color white = Colors.white;
}
 ThemeData lightThemeData() {
    return ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
        textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
            titleSmall: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                letterSpacing: 0.4)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.themeColor,
            padding: const EdgeInsets.symmetric(vertical: 12),
            foregroundColor: AppColors.white,
            fixedSize: const Size.fromWidth(double.maxFinite),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
                textStyle: const TextStyle(fontWeight: FontWeight.w600))));
  }