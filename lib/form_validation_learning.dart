import 'package:flutter/material.dart';

//Form Validation
class FormValidationLearning extends StatefulWidget {
  const FormValidationLearning({super.key});

  @override
  State<FormValidationLearning> createState() => _FormValidationLearningState();
}

class _FormValidationLearningState extends State<FormValidationLearning> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm(){
    if(_formKey.currentState!.validate()){
      ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
          const SnackBar(content: Text('Form Submitted Successfully')));
    }
  }
  String? _validateEmail(value){
    if(value!.isEmpty){
      return 'Please Enter your email';
    }
    RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if(!emailRegExp.hasMatch(value)){
      return 'Please Enter a valid email';
    }
    return null;
  }

  String? _validatePhoneNumber(value){
    if(value!.isEmpty){
      return 'Please Enter your phone number';
    }
    if(value.length != 11){
      return 'Please Enter 11 digit number';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Form'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                labelText: 'Enter your username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Please Enter your username';
                }
                return null;
              },
            ),
            SizedBox(height: 16,),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              validator: _validateEmail,
            ),
            SizedBox(height: 16,),
            TextFormField(
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                labelText: 'Enter your phone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              validator: _validatePhoneNumber,
            ),
            SizedBox(height: 16,),
            InkWell(
              onTap: _submitForm,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                height: 50,
                width: double.infinity,
                child: Center(child: Text('Submit',style: TextStyle(fontSize: 22,color: Colors.white),)),
              ),
            )
          ],
        )),
      ),
    );
  }
}