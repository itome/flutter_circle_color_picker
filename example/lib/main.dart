import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _currentColor = Colors.blue;
  final _controller = CircleColorPickerController(
    initialColor: Colors.blue,
  );

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
            const SizedBox(height: 48),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () => _controller.color = Colors.blue,
                  child: Text('BLUE', style: TextStyle(color: Colors.blue)),
                ),
                TextButton(
                  onPressed: () => _controller.color = Colors.green,
                  child: Text('GREEN', style: TextStyle(color: Colors.green)),
                ),
                TextButton(
                  onPressed: () => _controller.color = Colors.red,
                  child: Text('RED', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
