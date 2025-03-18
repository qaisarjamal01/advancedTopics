import 'package:advanced_topics/firebase/FirebaseAuth/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../components/custom_text_form_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController    = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth LogIn'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            SizedBox(height: height * 0.03,),
            CustomTextFormField(labelText: 'Enter your email', controller: emailController),
            SizedBox(height: height * 0.03),
            CustomTextFormField(labelText: 'Enter your password', controller: passwordController),
            SizedBox(height: height * 0.03,),
            ElevatedButton(onPressed: (){

            }, child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),
            SizedBox(height: height * 0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",style: TextStyle(fontSize: 16),),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen()));
                    },
                    child: Text('SignUp',style: TextStyle(color: Colors.red,fontSize: 16),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
