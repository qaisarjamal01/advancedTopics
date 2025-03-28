import 'dart:developer';
import 'package:advanced_topics/components/custom_text_form_field.dart';
import 'package:advanced_topics/firebase/FirebaseAuth/firebase_auth_service.dart';
import 'package:advanced_topics/firebase/FirebaseAuth/home.dart';
import 'package:advanced_topics/firebase/FirebaseAuth/log_in_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuthService();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth SignUp'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(height: height * 0.03),
                CustomTextFormField(
                  labelText: 'Enter your name',
                  controller: nameController,
                ),
                SizedBox(height: height * 0.03),
                CustomTextFormField(
                  labelText: 'Enter your email',
                  controller: emailController,
                ),
                SizedBox(height: height * 0.03),
                CustomTextFormField(
                  labelText: 'Enter your password',
                  controller: passwordController,
                ),
                SizedBox(height: height * 0.03),
                ElevatedButton(
                  onPressed: _signUp,
                  child: Text(
                    'SignUp',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LogInScreen()),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  goToHome() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
  }

  _signUp() async {
    final user = await _auth.createUserWithEmailAndPassword(
      emailController.text,
      passwordController.text,
    );
    if (user != null) {
      log('User Created Successfully');
      goToHome();
    }
  }
}