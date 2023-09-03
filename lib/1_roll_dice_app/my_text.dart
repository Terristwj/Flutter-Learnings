import "package:flutter/material.dart";

// Styling
const myTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 48,
);

// Text Widget
class MyText extends StatelessWidget {
  const MyText(this.text, {super.key});
  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: myTextStyle,
    );
  }
}
