import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _currentColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: _currentColor,
          title: const Text('Circle color picker sample'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: CircleColorPicker(
                  initialColor: _currentColor,
                  onChanged: _onColorChanged,
                ),
              ),
              Center(
                child: CircleColorPicker(
                  initialColor: _currentColor,
                  onChanged: _onColorChanged,
                  colorCodeBuilder: (context, color) {
                    return Text(
                      'rgb(${color.red}, ${color.green}, ${color.blue})',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onColorChanged(Color color) {
    setState(() => _currentColor = color);
  }
}
