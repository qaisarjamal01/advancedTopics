import 'package:flutter/material.dart';

class CustomPainters extends StatefulWidget {
  const CustomPainters({super.key});

  @override
  State<CustomPainters> createState() => _CustomPaintersState();
}

class _CustomPaintersState extends State<CustomPainters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.grey[200],
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 3
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}