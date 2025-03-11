import 'package:flutter/material.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Employee',style: TextStyle(color: Colors.blue,fontSize: 24,fontWeight: FontWeight.bold)),
            Text('Form',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 24))
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}