part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final List<Book>? books;

  const HomeState({
    this.isLoading = false,
    books
  }) : books = books ?? const [];

  HomeState copyWith({
    bool? isLoading,
    List<Book>? books
  }) => HomeState(
    isLoading: isLoading ?? this.isLoading,
    books: books ?? this.books
  );
  
  @override
  List<Object?> get props => [ isLoading, books ];
}

final class HomeInitial extends HomeState {}
