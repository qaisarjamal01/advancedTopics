import 'dart:ui';
import 'package:flutter/material.dart';

class CustomPainters extends StatefulWidget {
  const CustomPainters({super.key});

  @override
  State<CustomPainters> createState() => _CustomPaintersState();
}

class _CustomPaintersState extends State<CustomPainters> {
  Color selectedColor = Colors.black;
  double strokeWidth = 5;
  List<DrawingPoint?> drawingPoints = [];
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
      appBar: AppBar(
        title: const Text("Drawing App"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: () {
              if (drawingPoints.isNotEmpty) {
                setState(() {
                  drawingPoints.removeLast();
                });
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() {
                drawingPoints.clear();
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          GestureDetector(
            onPanStart: (details) {
              setState(() {
                drawingPoints.add(DrawingPoint(
                  details.localPosition,
                  Paint()
                    ..color = selectedColor
                    ..isAntiAlias = true
                    ..strokeWidth = strokeWidth
                    ..strokeCap = StrokeCap.round,
                ));
              });
            },
            onPanUpdate: (details) {
              setState(() {
                drawingPoints.add(DrawingPoint(
                  details.localPosition,
                  Paint()
                    ..color = selectedColor
                    ..isAntiAlias = true
                    ..strokeWidth = strokeWidth
                    ..strokeCap = StrokeCap.round,
                ));
              });
            },
            onPanEnd: (details) {
              setState(() {
                drawingPoints.add(null); // Adds a break in the drawing
              });
            },
            child: CustomPaint(
              painter: _DrawingPainter(drawingPoints),
              child: SizedBox.expand(),
            ),
          ),
          Positioned(
              top: 40,
              right: 30,
              child: Row(
                children: [
                  Slider(
                      min: 0,
                      max: 40,
                      value: strokeWidth, onChanged: (val) => setState(() => strokeWidth = val)),
                  ElevatedButton.icon(
                      onPressed: () => setState(() => drawingPoints = []), 
                      icon: Icon(Icons.clear),
                      label: Text('Clear Board')),
                ],
              ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.grey[200],
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
            List.generate(colors.length, (index) => buildColorChoose(colors[index])),
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

class _DrawingPainter extends CustomPainter {
  final List<DrawingPoint?> drawingPoints;

  _DrawingPainter(this.drawingPoints);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < drawingPoints.length - 1; i++) {
      if (drawingPoints[i] != null && drawingPoints[i + 1] != null) {
        canvas.drawLine(
          drawingPoints[i]!.offset,
          drawingPoints[i + 1]!.offset,
          drawingPoints[i]!.paint,
        );
      } else if (drawingPoints[i] != null && (i + 1 == drawingPoints.length || drawingPoints[i + 1] == null)) {
        canvas.drawPoints(
          PointMode.points,
          [drawingPoints[i]!.offset],
          drawingPoints[i]!.paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DrawingPoint {
  Offset offset;
  Paint paint;

  DrawingPoint(this.offset, this.paint);
}