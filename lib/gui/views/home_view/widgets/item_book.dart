import 'package:flutter/material.dart';
import 'package:prueba_tecnica_inlaze/core/model/book_data.dart';
import 'package:prueba_tecnica_inlaze/gui/app_style.dart';

class ItemBook extends StatelessWidget {
  final Book book;
  const ItemBook({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10)
      ),
      margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          SizedBox(
            width: 180.0,
            child: Image.network(book.image),
          ),
          Text(book.price, style: Theme.of(context).textTheme.titleMedium!.copyWith( fontWeight: FontWeight.bold, fontSize: 15.0 )),
          Expanded(
            child: Text(book.title, style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontWeight: FontWeight.w400, fontSize: 15.0 ), textAlign: TextAlign.center,)
          )
        ],
      ),
    );
  }
}