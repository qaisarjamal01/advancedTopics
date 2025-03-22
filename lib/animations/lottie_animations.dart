import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimations extends StatefulWidget {
  const LottieAnimations({super.key});

  @override
  State<LottieAnimations> createState() => _LottieAnimationsState();
}

class _LottieAnimationsState extends State<LottieAnimations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottie Animations'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Lottie.asset(
          'assets/welcome.animations.json',
        ),
      ),
    );
  }
}