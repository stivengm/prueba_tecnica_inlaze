part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HandleLoader extends HomeEvent {
  final bool isLoading;
  const HandleLoader(this.isLoading);
}

class HandleFocusSearch extends HomeEvent {
  final bool isFocusedSearch;
  const HandleFocusSearch(this.isFocusedSearch);
}

class HandleValueSearch extends HomeEvent {
  final String valueSearch;
  const HandleValueSearch(this.valueSearch);
}

class SearchRecient extends HomeEvent {
  final List<String> searchRecient;
  const SearchRecient(this.searchRecient);
}

class HandleBooks extends HomeEvent {
  final List<Book> books;
  const HandleBooks(this.books);
}

class HandleBooksRecientVisited extends HomeEvent {
  final List<Book> booksRecientVisited;
  const HandleBooksRecientVisited(this.booksRecientVisited);
}

class HandleResultSearch extends HomeEvent {
  final List<Book> resultsSearch;
  const HandleResultSearch(this.resultsSearch);
}