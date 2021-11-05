import 'dart:io';

import 'package:bless_me/constants.dart';
import 'package:flutter/material.dart';


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