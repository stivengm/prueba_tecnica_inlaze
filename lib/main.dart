import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_inlaze/core/config/index.dart';
import 'package:prueba_tecnica_inlaze/core/providers/bloc_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiBlocProvider(
      providers: providerBloc,
      child: mateApp(textTheme)
    );
  }

  MaterialApp mateApp(textTheme) => MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: AppTheme().theme(textTheme),
    routes: routesApp(),
    initialRoute: 'login'
  );
}
