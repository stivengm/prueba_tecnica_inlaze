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

    on<HandleFocusSearch>((event, emit) {
      emit( state.copyWith( isFocusedSearch: event.isFocusedSearch ) );
    });

    on<HandleValueSearch>((event, emit) {
      emit( state.copyWith( valueSearch: event.valueSearch ) );
    });

    on<SearchRecient>((event, emit) {
      emit( state.copyWith( searchRecient: event.searchRecient ) );
    });

    on<HandleBooks>((event, emit) {
      emit( state.copyWith( books: event.books ) );
    });

    on<HandleBooksRecientVisited>((event, emit) {
      emit( state.copyWith( booksRecientVisited: event.booksRecientVisited ) );
    });

    on<HandleResultSearch>((event, emit) {
      emit( state.copyWith( resultsSearch: event.resultsSearch ) );
    });
  }
}
