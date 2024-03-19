import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpProvider<T> {

  String? endPoint;

  HttpProvider({ required this.endPoint });

  Uri _url () => Uri.https('api.itbook.store', '$endPoint');

  Future<T?> get() async {
    try {
      final response = await http.get(_url as Uri);
      return (response.statusCode == 200) ? jsonDecode(response.body) : null;
    } catch (e) {
      return null;
    }
  }

}