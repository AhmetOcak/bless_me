import 'dart:io';

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

class Button extends StatelessWidget {
  const Button({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        if(text == 'Yes') {
          Navigator.pushNamed(context, '/home');
        }
        else {
          exit(0);
        }
      },
      child: Text(
        text,
        style: const TextStyle(color: shadowColor, fontSize: 25),
      ),
      splashColor: shadowColor,
      shape: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: shadowColor),
      ),
    );
  }
}
