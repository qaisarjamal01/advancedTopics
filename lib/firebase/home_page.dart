import 'package:advanced_topics/firebase/employee.dart';
import 'package:advanced_topics/firebase/service/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream? EmployeeStream;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Employee()),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flutter',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Firebase',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 20,left: 20,right: 20),
          child: Column(children: [
            Expanded(
              child: StreamBuilder(
                stream: DatabaseMethods().getEmployeeDetails(),
                builder: (context,AsyncSnapshot snapshot){
                return snapshot.hasData? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                    itemBuilder: (context,index){
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name : '+ds['Name'],style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                              Text('Age : '+ds['Age'],style: TextStyle(color: Colors.orange,fontSize: 20,fontWeight: FontWeight.bold),),
                              Text('Location : '+ds['Location'],style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ),
                    );
                    })
                    :Container();
              }),
            )
      ])),
    );
  }
}