import 'package:prueba_tecnica_inlaze/core/providers/http_providers.dart';

class HomeService {

  Future<dynamic> getNewBooks() async {
    try {
      final resp = HttpProvider(endPoint: '1.0/new').get();
      return resp;
    } catch (e) {
      return e;
    }
  }

}