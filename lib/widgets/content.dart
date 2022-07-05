import 'package:flutter/material.dart';

/// Center Widget Components
class Content extends StatelessWidget {
  const Content({
    Key? key,
    required this.titletextStyle,
    required this.subTitletextStyle,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final TextStyle titletextStyle;
  final TextStyle subTitletextStyle;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: titletextStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: subTitletextStyle,
          ),
        ),
      ],
    );
  }
}
