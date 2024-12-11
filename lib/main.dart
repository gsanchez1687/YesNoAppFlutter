import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/feature/chat/home/chat_scream.dart';
import 'package:yes_no_app/feature/providers/chat_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ChatProvider()),
      ],
      child: MaterialApp(
        title: 'YES NO APP',
        debugShowCheckedModeBanner: false,
        theme: AppTheme( selectedColor: 3 ).theme,
        home: const ChatScream(),
      ),
    );
  }
}