import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prueba_tecnica_inlaze/core/model/book_data.dart';
import 'package:prueba_tecnica_inlaze/gui/app_style.dart';
import 'package:prueba_tecnica_inlaze/gui/widgets/primary_button.dart';

class DetailsBookArguments {
  final Book book;
  DetailsBookArguments(this.book);
}

class DetailsBookView extends StatelessWidget {
  const DetailsBookView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailsBookArguments;

    Size media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundApp,
      appBar: AppBar(
        backgroundColor: backgroundApp,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.heart
            ),
            color: primaryColor,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
          child: Column(
            children: [
              Hero(
                tag: args.book.isbn13,
                child: Image(
                  width: media.height * 1,
                  height: media.height * .5,
                  image: NetworkImage(args.book.image, scale: .1)
                ),
              ),
              Text(args.book.title, style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontWeight: FontWeight.w600, fontSize: 19.0 ), textAlign: TextAlign.center),
              const SizedBox(height: 5.0),
              args.book.subtitle != "" ? RichText(
                text: TextSpan(
                  text: 'Descripción: ',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontWeight: FontWeight.bold, fontSize: 15 ),
                  children: [
                    TextSpan(
                      text: args.book.subtitle,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontWeight: FontWeight.normal, fontSize: 15 ),
                    )
                  ]
                ),
              ) : const SizedBox(),
              const SizedBox(height: 20.0),
              Text("Precio: ${args.book.price}", style: Theme.of(context).textTheme.headlineLarge!.copyWith( fontSize: 20.0, fontWeight: FontWeight.bold ),),
              const SizedBox(height: 30.0),
              SizedBox(
                width: media.width * .5,
                child: PrimaryButton(text: 'Comprar', onPressed: () {},),
              )
            ],
          ),
        ),
      ),
    );
  }
}