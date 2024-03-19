import 'package:flutter/material.dart';
import 'package:prueba_tecnica_inlaze/core/config/app_paths.dart';
import 'package:prueba_tecnica_inlaze/core/config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(textTheme),
      routes: routesApp(),
      initialRoute: 'login'
    );
  }
}
