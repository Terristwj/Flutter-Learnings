import "package:flutter/material.dart";

// Styling
const myTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 48,
);

// Text Widget
class MyText extends StatelessWidget {
  const MyText({
    super.key,
  });

  @override
  Widget build(context) {
    return const Text(
      "Kon'nichiwa!",
      style: myTextStyle,
    );
  }
}
