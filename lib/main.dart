import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Touch to Place Icon')),
        body: TouchPosition(),
      ),
    );
  }
}

class TouchPosition extends StatefulWidget {
  @override
  _TouchPositionState createState() => _TouchPositionState();
}

class _TouchPositionState extends State<TouchPosition> {
  double? _xPosition;
  double? _yPosition;

  void _updatePosition(TapDownDetails details) {
    setState(() {
      _xPosition = details.localPosition.dx;
      _yPosition = details.localPosition.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _updatePosition,
      child: Stack(
        children: [
          // Main content goes here
          Container(color: Colors.white),
          // Positioned icon
          if (_xPosition != null && _yPosition != null)
            Positioned(
              left: _xPosition! - 12.5, // Adjust to center the icon
              top: _yPosition! - 12.5, // Adjust to center the icon
              child: Icon(Icons.location_on, size: 50, color: Colors.red),
            ),
        ],
      ),
    );
  }
}
