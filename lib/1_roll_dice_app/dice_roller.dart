import "dart:math";
import 'package:flutter/material.dart';
import "package:flutter_learnings/1_roll_dice_app/my_text.dart";

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;
  void rollDice() {
    // SetState is required to re-render the widget
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const MyText("Kon'nichiwa!", 48),
        const SizedBox(height: 20),
        Image.asset(
          "assets/images/dice-$currentDiceRoll.png",
          // width: 200,
          scale: 3,
        ),
        ElevatedButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 247, 237, 240),
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
          ),
          child: MyText("Roll Dice!", 20),
        ),
      ],
    );
  }
}
