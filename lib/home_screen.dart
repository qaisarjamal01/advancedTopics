import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(
          decoration: InputDecoration.collapsed(hintText: 'Enter your name'),
          onChanged: (String text){
            print('text $text');
          },
          onSubmitted: (String text){
            print('text $text');
          },
        ),
      ),
    );
  }
}