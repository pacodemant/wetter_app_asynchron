// ignore_for_file: prefer__ructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wetter_app_asynchron/presentation/screens/home_page.dart';
class TheApp extends StatelessWidget {
  const TheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wetter-App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const HomePage(title: '(Task 5.6.3)'),
    );
  }
}
