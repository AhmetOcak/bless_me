import 'package:bless_me/components/button.dart';
import 'package:bless_me/constants.dart';
import 'package:flutter/material.dart';

class HolyScreen extends StatelessWidget {
  const HolyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you want to be blessed, little human?',
            style: TextStyle(
              fontFamily: 'ZenKurenaido',
              color: shadowColor,
              fontSize: 40,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Button(
                text: 'Yes',
              ),
              Button(
                text: 'No',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

