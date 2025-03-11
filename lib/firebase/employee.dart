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
        margin: EdgeInsets.only(left: 20,top: 30,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}