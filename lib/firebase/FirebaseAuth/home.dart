import 'package:advanced_topics/firebase/FirebaseAuth/firebase_auth_service.dart';
import 'package:advanced_topics/firebase/FirebaseAuth/log_in_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Welcome',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),)),
          SizedBox(height: height * 0.02,),
          ElevatedButton(onPressed: () async{
            await _auth.signOut();
            goToLogin();
          }, child: Text('SignOut'))
        ],
      ),
    );
  }

  goToLogin(){
    Navigator.push(context, MaterialPageRoute(builder: (_) => LogInScreen()));
  }
}