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

class HandleBooks extends HomeEvent {
  final List<Book> books;
  const HandleBooks(this.books);
}