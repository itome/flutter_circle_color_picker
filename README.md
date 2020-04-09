# flutter_circle_color_picker
[![pub package](https://img.shields.io/pub/v/flutter_circle_color_picker.svg)](https://pub.dartlang.org/packages/flutter_circle_color_picker)

A beautiful circle color picker for flutter.

|Light theme|Dark Theme|
| --- | --- |
| ![sample light theme](https://user-images.githubusercontent.com/24409457/69745423-82bd7b80-1185-11ea-9ea5-70ab5596d872.gif) | ![sample dark theme](https://user-images.githubusercontent.com/24409457/69745500-a84a8500-1185-11ea-9e90-28492227e779.gif) |


## Usage

```dart
...
        body: Center(
          child: CircleColorPicker(
            initialColor: Colors.blue,
            onChanged: (color) => print(color),
            size: const Size(240, 240),
            strokeWidth: 4,
            thumbSize: 36,
          ),
        ),
...
```

## API

```dart
  /// Called during a drag when the user is selecting a color.
  ///
  /// This callback called with latest color that user selected.
  final ValueChanged<Color> onChanged;

  /// The size of widget.
  /// Draggable area is thumb widget is included to the size,
  /// so circle is smaller than the size.
  ///
  /// Default value is 280 x 280.
  final Size size;

  /// The width of circle border.
  ///
  /// Default value is 2.
  final double strokeWidth;

  /// The size of thumb for circle picker.
  ///
  /// Default value is 32.
  final double thumbSize;

  /// Initial color for picker.
  /// [onChanged] callback won't be called with initial value.
  ///
  /// Default value is Red.
  final Color initialColor;

  /// Text style config
  ///
  /// Default value is Black
  final TextStyle textStyle;

  /// Widget builder that show color code section.
  /// This functions is called every time color changed.
  ///
  /// Default is Text widget that shows rgb strings;
  final ColorCodeBuilder colorCodeBuilder;
```
