import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_inlaze/core/bloc/home_bloc/home_bloc.dart';
import 'package:prueba_tecnica_inlaze/core/bloc/internet/internet_bloc.dart';

final List<BlocProvider> providerBloc = [
  BlocProvider<HomeBloc>(create: ( _ ) => HomeBloc()),
  BlocProvider<InternetBloc>(create: ( _ ) => InternetBloc()),
];