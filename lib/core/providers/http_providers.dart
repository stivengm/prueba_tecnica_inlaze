import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpProvider<T> {
  
  final String endPoint;

  HttpProvider({ required this.endPoint });

  Future<T?> get() async {
    final Uri url = Uri.https('api.itbook.store', endPoint);

    try {
      final response = await http.get(url);
      return (response.statusCode == 200) ? jsonDecode(response.body) : null;
    } catch (e) {
      return null;
    }
  }

}