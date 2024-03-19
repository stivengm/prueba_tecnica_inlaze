import 'package:prueba_tecnica_inlaze/core/model/book_data.dart';

abstract class HomeViewModel {
  void showContactList(List<Book> items);

  void showError();
}