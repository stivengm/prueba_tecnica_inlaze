import 'package:prueba_tecnica_inlaze/core/model/book_data.dart';

abstract class HomeViewModel {
  void showBooksList(List<Book> items);

  void searchBooksList(List<Book> items, String searchValue, bool eventSearch);

  void showError();
}