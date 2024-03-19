import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica_inlaze/core/model/book_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HandleLoader>((event, emit) {
      emit( state.copyWith( isLoading: event.isLoading ) );
    });

    on<HandleBooks>((event, emit) {
      emit( state.copyWith( books: event.books ) );
    });
  }
}
