import "package:flutter/material.dart";
import "package:flutter_learnings/1_roll_dice_app/my_container.dart";

void main() {
  runApp(
    const MyApp(),
  );
  // runApp(const MaterialApp(home: Text("Kon'nichiwa!")));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // backgroundColor: const Color.fromARGB(255, 253, 225, 234),
        body: MyContainer(),
      ),
    );
  }
}
