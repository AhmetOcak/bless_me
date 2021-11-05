import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bless_me/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Timer _timer;

  int sizeController = 1;
  bool isItClicked = false;
  int animationDuration = 5;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: animationDuration),);

    _controller.addStatusListener((status) {
      setState(() {
        if(status == AnimationStatus.completed) {
          sizeController = 1;
          animationDuration = 5;
          _timer = Timer(const Duration(seconds: 5), () { 
            isItClicked = false;
            Navigator.pop(context);
          });
        }
      });
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller.view,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * pi,
                  child: child,
                );
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 5),
                curve: Curves.bounceIn,
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: isItClicked ? 40.0 : 0.0,
                        color: shadowColor,
                      ),
                    ]),
                constraints: BoxConstraints(
                  minHeight:
                      MediaQuery.of(context).size.height / 8 * sizeController,
                  minWidth:
                      MediaQuery.of(context).size.width / 4 * sizeController,
                  maxHeight:
                      MediaQuery.of(context).size.height / 8 * sizeController,
                  maxWidth:
                      MediaQuery.of(context).size.width / 4 * sizeController,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      sizeController = 3;
                      isItClicked = true;
                      _controller.forward();
                    });
                  },
                  child: Center(
                    child: Text(
                      'Bless me',
                      style: TextStyle(
                        color: isItClicked ? shadowColor : Colors.black,
                        fontFamily: 'ZenKurenaido',
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
