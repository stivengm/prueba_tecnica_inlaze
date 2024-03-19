import 'package:flutter/material.dart';
import 'package:prueba_tecnica_inlaze/gui/views/details_book_view/details_book_view.dart';
import 'package:prueba_tecnica_inlaze/gui/views/home_view/home_view.dart';
import 'package:prueba_tecnica_inlaze/gui/views/login_view/login_view.dart';

Map<String, WidgetBuilder> routesApp() => <String, WidgetBuilder> {

  'login': ( _ ) => const LoginView(),
  'home': ( _ ) => const HomeView(),
  'details_book': ( _ ) => const DetailsBookView(),

};