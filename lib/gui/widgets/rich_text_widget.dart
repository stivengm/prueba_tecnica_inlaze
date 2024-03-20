import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  final String name;
  final String value;
  const RichTextWidget({super.key, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: name,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith( fontSize: 15.0, fontWeight: FontWeight.bold ),
        children: [
          TextSpan(
            text: value,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith( fontSize: 15.0, fontWeight: FontWeight.normal ),
          )
        ]
      ),
    );
  }
}