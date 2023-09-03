import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        // backgroundColor: const Color.fromARGB(255, 253, 225, 234),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 253, 225, 234),
                Color.fromARGB(255, 253, 225, 234),
                Color.fromARGB(255, 231, 253, 225),
                Color.fromARGB(255, 231, 253, 225),
                Color.fromARGB(255, 225, 253, 250),
                Color.fromARGB(255, 225, 253, 250),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: const Center(
            child: Text(
              "Kon'nichiwa!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 48,
              ),
            ),
          ),
        ),
      ),
    ),
  );
  // runApp(const MaterialApp(home: Text("Kon'nichiwa!")));
}
