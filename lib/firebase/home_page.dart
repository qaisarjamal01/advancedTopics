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
  TextEditingController nameController     = TextEditingController();
  TextEditingController ageController      = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    ageController.dispose();
    locationController.dispose();
  }
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
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: DatabaseMethods().getEmployeeDetails(),
                builder: (context, AsyncSnapshot snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
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
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Name : ${ds['Name']}',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                            onTap: (){
                                              nameController.text     = ds['Name'];
                                              ageController.text      = ds['Age'];
                                              locationController.text = ds['Location'];
                                              editEmployeeDetails(ds['Id']);
                                            },
                                            child: Icon(Icons.edit,color: Colors.orange,)),
                                        SizedBox(width: 5.0,),
                                        GestureDetector(
                                            onTap: () async{
                                              await DatabaseMethods().deleteEmployeeDetails(ds['Id']);
                                            },
                                            child: Icon(Icons.delete,color: Colors.orange,))
                                      ],
                                    ),
                                    Text(
                                      'Age : ${ds['Age']}',
                                      style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Location : ${ds['Location']}',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                      : Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future editEmployeeDetails(String id)=>showDialog(context: context, builder: (context) => AlertDialog(
    content: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.cancel)),
              SizedBox(width: 60,),
              Text(
                'Edit',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Details',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Text(
            'Name',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Age',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(),
            ),
            child: TextField(
              controller: ageController,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Location',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: locationController,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          SizedBox(height: 30,),
          Center(
            child: ElevatedButton(onPressed: () async{
              Map<String,dynamic> updateInfo = {
                'Name'    : nameController.text,
                'Age'     : ageController.text,
                'Location': locationController.text,
                'Id'      : id
              };
              await DatabaseMethods().updateEmployeeDetails(id, updateInfo);

              //we use this instead of .then because it checks widget is still in widget tree then call
              if(context.mounted){
                Navigator.pop(context);
              }
            }, child: Text('Update')),
          )
        ],
      ),
    ),
  ));
}