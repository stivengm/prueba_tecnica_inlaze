import 'package:flutter/material.dart';
import 'package:prueba_tecnica_inlaze/gui/app_style.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundApp,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Image(
                image: AssetImage("assets/no_internet.png")
              ),
              Text("No hay conexión a internet!", style: Theme.of(context).textTheme.headlineSmall!.copyWith( fontWeight: FontWeight.bold)),
              const SizedBox(height: 10.0),
              Text("Por favor conéctate a internet para poder seguir usando la aplicación.", style: Theme.of(context).textTheme.headlineSmall!.copyWith( fontSize: 14.0), textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}