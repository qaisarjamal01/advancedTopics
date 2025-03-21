import 'package:flutter/material.dart';

class CustomPainters extends StatefulWidget {
  const CustomPainters({super.key});

  @override
  State<CustomPainters> createState() => _CustomPaintersState();
}

class _CustomPaintersState extends State<CustomPainters> {

  Color selectedColor = Colors.black;
  List<Color> colors = [
    Colors.blue,
    Colors.black,
    Colors.yellow,
    Colors.white,
    Colors.pink,
    Colors.red,
    Colors.green
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: CustomPaint(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.grey[200],
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(colors.length, (index) => buildColorChoose(colors[index]))
          ),
        ),
      ),
    );
  }

  Widget buildColorChoose(Color color) {
    bool isSelected = selectedColor == color;
    return GestureDetector(
      onTap: () => setState(() => selectedColor = color),
      child: Container(
        height: isSelected ? 47 : 40,
        width: isSelected ? 47 : 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected ? Border.all(color: Colors.white, width: 3) : null,
        ),
      ),
    );
  }
}

class _drawingPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}