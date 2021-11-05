import 'package:bless_me/screens/holy_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/holy',
    routes: {
      '/holy': (context) => const HolyScreen(),
      '/home': (context) => const HomeScreen(),
    },
  ));
}
