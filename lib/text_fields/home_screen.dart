import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  String value = '';

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextField(
              controller: nameController,
              //here collapsed means it has no default borders
              decoration: InputDecoration.collapsed(
                hintText: 'Enter your name',
              ),
              onChanged: (String text) {
                //here showing every text when i typed
                setState(() {
                  value = text;
                });
              },
              onSubmitted: (String text) {
                //print when click on done or ok button or check button
                setState(() {
                  value = text;
                });
                nameController.clear();
              },
            ),
          ),
          Text('\n\n $value'),
        ],
      ),
    );
  }
}