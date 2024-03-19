import 'package:prueba_tecnica_inlaze/core/model/book_data.dart';
import 'package:prueba_tecnica_inlaze/core/services/home_services.dart';
import 'package:prueba_tecnica_inlaze/gui/views/home_view/home_viewmodel.dart';

class HomePresenter {

  final HomeViewModel _view;
  late HomeService _homeService;

  HomePresenter(this._view) {
    _homeService = HomeService();
  }

  void getNewBooks() async {

    try {
      var response = await _homeService.getNewBooks();
      final List books = response['books'];

      var listBook = books
        .map((book) => Book.fromJson(book))
        .toList();
      _view.showContactList(listBook);
    } catch (e) {
      _view.showError();
    }
  }

}