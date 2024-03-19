import 'package:flutter/material.dart';
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
      ),
      body: Column(
        children: [
          Image(
            width: media.height * .8,
            height: media.height * .6,
            image: NetworkImage(args.book.image)
          ),
          Text(args.book.title),
          const Text("Description: "),
          const Text("Precio: 12312312"),
          SizedBox(
            width: media.width * .5,
            child: PrimaryButton(text: 'Comprar', onPressed: () {},),
          )
        ],
      ),
    );
  }
}