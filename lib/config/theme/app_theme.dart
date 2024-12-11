import 'package:flutter/material.dart';

const Color custonColor = Color(0xFF5D3FD3);
const List<Color> colorThemes = [
  custonColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Color(0xFF34C759)
];

class AppTheme {
  late final int selectedColor;
  AppTheme({
    this.selectedColor = 0,
  }) : assert(selectedColor >= 0 && selectedColor < colorThemes.length, 'Color must be between 0 and ${colorThemes.length - 1}');
  
  ThemeData get theme => ThemeData(
        textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white, fontSize: 20)),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: colorThemes[selectedColor],
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.transparent, // Set scaffold background to transparent
      );
}
