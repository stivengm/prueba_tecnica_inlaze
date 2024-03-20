part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final bool isFocusedSearch;
  final String valueSearch;
  final List<String>? searchRecient;
  final List<Book>? resultsSearch;
  final List<Book>? books;
  final List<Book>? booksRecientVisited;

  const HomeState({
    this.isLoading = false,
    this.isFocusedSearch = false,
    this.valueSearch = "",
    resultsSearch,
    books,
    booksRecientVisited,
    searchRecient
  }) : books = books ?? const [],
    resultsSearch = resultsSearch ?? const [],
    booksRecientVisited = booksRecientVisited ?? const [],
    searchRecient = searchRecient ?? const [];

  HomeState copyWith({
    bool? isLoading,
    bool? isFocusedSearch,
    String? valueSearch,
    List<String>? searchRecient,
    List<Book>? books,
    List<Book>? resultsSearch,
    List<Book>? booksRecientVisited,
  }) => HomeState(
    isLoading: isLoading ?? this.isLoading,
    isFocusedSearch: isFocusedSearch ?? this.isFocusedSearch,
    valueSearch: valueSearch ?? this.valueSearch,
    searchRecient: searchRecient ?? this.searchRecient,
    resultsSearch: resultsSearch ?? this.resultsSearch,
    books: books ?? this.books,
    booksRecientVisited: booksRecientVisited ?? this.booksRecientVisited
  );
  
  @override
  List<Object?> get props => [ isLoading, valueSearch, isFocusedSearch, searchRecient, books, booksRecientVisited, resultsSearch ];
}

final class HomeInitial extends HomeState {}
