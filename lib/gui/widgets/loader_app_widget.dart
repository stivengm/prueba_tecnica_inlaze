import 'package:flutter/material.dart';
import 'package:prueba_tecnica_inlaze/gui/app_style.dart';

class LoaderApp extends StatelessWidget {
  const LoaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: primaryColor,
      ),
    );
  }
}