import 'package:flutter/material.dart';
import 'package:bless_me/constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 4),);

    _animation = CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn  );
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {
        
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: '',
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: buttonColor,
                      blurRadius: _animation.value * MediaQuery.of(context).size.height / 2,
                      spreadRadius: _animation.value * 20,
                    ),
                  ],
                ),
                child: RawMaterialButton(
                  constraints: BoxConstraints(
                    minHeight: _animation.value * MediaQuery.of(context).size.height / 4,
                    minWidth:  _animation.value * MediaQuery.of(context).size.width / 2,
                  ),
                  onPressed: () {
                    
                  },
                  fillColor: buttonColor,
                  child: const Text(
                    'Bless me',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'ZenKurenaido',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  shape: const CircleBorder(
                    side: BorderSide.none,
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
