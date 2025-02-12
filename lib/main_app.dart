import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'utils/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Manager',
      theme: AppTheme.lightTheme,
      home: MainScreen(),
    );
  }
}
