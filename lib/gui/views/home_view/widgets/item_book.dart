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
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.only(top: 10.0, right: 6.0, bottom: 20.0, left: 6.0),
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: 180.0,
                height: 198,
                child: Hero(
                  tag: book.isbn13,
                  child: FadeInImage(
                    fadeInDuration: const Duration(milliseconds: 200),
                    placeholder: const AssetImage('assets/loader_image.gif'),
                    image: NetworkImage(book.image),
                  ),
                ),
              ),
              Text(book.price, style: Theme.of(context).textTheme.titleMedium!.copyWith( fontWeight: FontWeight.bold, fontSize: 15.0 )),
              Expanded(
                child: Text(book.title, style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontWeight: FontWeight.w400, fontSize: 15.0 ), textAlign: TextAlign.center,)
              )
            ],
          ),
          Positioned(
            top: 5,
            right: 0,
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(100)
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.heart_broken
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}