import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _currentColor = Colors.grey.shade500;
  final _controller = CircleColorPickerController(
      initialColor: Colors.grey.shade500, grayscale: false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: _currentColor,
          title: const Text('Circle color picker sample'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 48),
            Center(
              child: CircleColorPicker(
                controller: _controller,
                onChanged: (color) {
                  setState(() => _currentColor = color);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
