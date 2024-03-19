import 'package:flutter/material.dart';
import 'package:prueba_tecnica_inlaze/gui/app_style.dart';

import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBooks();
  }

  getBooks() async {
    // https://api.itbook.store/1.0/new
    final url = Uri.https('api.itbook.store', '1.0/new');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundApp,
      appBar: AppBar(

      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Explorar más.."),
                  TextField(
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Buscar',
                      hintStyle: const TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          width: 0, 
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: whiteColor,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Text("Nuevos libros")
                  ),
                  Text("Libros..")
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}