import 'package:flutter/material.dart';
import 'package:prueba_tecnica_inlaze/core/model/book_data.dart';
import 'package:prueba_tecnica_inlaze/gui/views/home_view/widgets/item_book.dart';
import 'package:prueba_tecnica_inlaze/gui/views/details_book_view/details_book_view.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(nameSection, style: Theme.of(context).textTheme.headlineSmall,),
          ),
          SizedBox(
            height: 315.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'details_book', arguments: DetailsBookArguments(books[i])),
                  child: ItemBook(book: books[i])
                );
              }
            ),
          )
        ],
      ),

    );
  }
}