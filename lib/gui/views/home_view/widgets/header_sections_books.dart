import 'package:flutter/material.dart';
import 'package:prueba_tecnica_inlaze/core/model/book_data.dart';
import 'package:prueba_tecnica_inlaze/gui/views/home_view/widgets/item_book.dart';

class HeaderSectionsBooks extends StatelessWidget {
  final List<Book> books;
  final String nameSection;
  const HeaderSectionsBooks({super.key, required this.books, required this.nameSection});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text("Nuevos libros"),
          ),
          Container(
            height: 300.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              itemBuilder: (context, i) {
                return ItemBook(book: books[i]);
              }
            ),
          )
        ],
      ),

    );
  }
}