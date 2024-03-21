import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:prueba_tecnica_inlaze/core/model/book_data.dart';

class DetailsPayBookArguments {
  final Book book;
  DetailsPayBookArguments(this.book);
}

class PayView extends StatelessWidget {
  const PayView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailsPayBookArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.book.title),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(args.book.url)
        ),
      ),
    );
  }
}