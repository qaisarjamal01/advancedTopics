import 'package:flutter/material.dart';

class FirebaseAuthDetails extends StatefulWidget {
  const FirebaseAuthDetails({super.key});

  @override
  State<FirebaseAuthDetails> createState() => _FirebaseAuthDetailsState();
}

class _FirebaseAuthDetailsState extends State<FirebaseAuthDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter your email',

            ),
          )
        ],
      ),
    );
  }
}
