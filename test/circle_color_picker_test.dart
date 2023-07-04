import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:flutter_test/flutter_test.dart';

final centerCircle = Key('center');
final lightnessThumb = Key('lightness');
final hueThumb = Key('hue');

Color? centerColor() {
  final center = find.byKey(centerCircle).evaluate().single.widget as Container;
  return (center.decoration as BoxDecoration).color;
}

Color? thumbColor(Key key) {
  final thumb = find.byKey(key).evaluate().single.widget as ColorPickerThumb;
  return thumb.color;
}

// helps matching MaterialColor and Color
class ColorIs extends Matcher {
  final Color _expectedColor;

  const ColorIs(this._expectedColor);

  @override
  Description describe(Description description) {
    return description.add('Color:<${Color(_expectedColor.value)}>');
  }

  @override
  bool matches(item, Map matchState) {
    final color = item as Color;

    // be tolerant for rounding errors
    final int tolerance = 1;
    return ((color.alpha - _expectedColor.alpha).abs() <= tolerance) &&
        ((color.red - _expectedColor.red).abs() <= tolerance) &&
        ((color.green - _expectedColor.green).abs() <= tolerance) &&
        ((color.blue - _expectedColor.blue).abs() <= tolerance);
  }
}

void main() {
  testWidgets('basic', (WidgetTester tester) async {
    Color currentColor = Colors.blue;
    final controller = CircleColorPickerController(initialColor: currentColor);

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CircleColorPicker(
          controller: controller,
          onChanged: (color) => {currentColor = color},
        ),
      ),
    );

    expect(find.byType(CircleColorPicker), findsOneWidget);
    expect(find.byKey(centerCircle), findsOneWidget);
    expect(find.byKey(hueThumb), findsOneWidget);
    expect(find.byKey(lightnessThumb), findsOneWidget);
    expect(currentColor, Colors.blue);
  });

  testWidgets('set color', (WidgetTester tester) async {
    Color currentColor = Colors.blue;
    final controller = CircleColorPickerController(initialColor: currentColor);

    await tester.pumpWidget(
      Directionality(
          textDirection: TextDirection.ltr,
          child: CircleColorPicker(
            controller: controller,
            onChanged: (color) => {currentColor = color},
          )),
    );

    final targetColor = Color(0xfff44336);

    controller.color = targetColor;
    await tester.pump();

    expect(
        (find.byType(Text).evaluate().single.widget as Text).data, "#f44336");
    expect(currentColor, ColorIs(targetColor));
    expect(controller.color, ColorIs(targetColor));
    expect(centerColor(), ColorIs(targetColor));
    expect(thumbColor(lightnessThumb),
        ColorIs(HSLColor.fromColor(targetColor).withSaturation(1.0).toColor()));
    expect(
        thumbColor(hueThumb),
        ColorIs(HSLColor.fromColor(targetColor)
            .withSaturation(1.0)
            .withLightness(0.5)
            .toColor()));
  });

  testWidgets('set color with alpha', (WidgetTester tester) async {
    Color currentColor = Colors.blue;
    final controller = CircleColorPickerController(initialColor: currentColor);

    await tester.pumpWidget(
      Directionality(
          textDirection: TextDirection.ltr,
          child: CircleColorPicker(
            controller: controller,
            onChanged: (color) => {currentColor = color},
          )),
    );

    final targetColor = Color(0x88d44136);

    controller.color = targetColor;
    await tester.pump();

    expect(
        (find.byType(Text).evaluate().single.widget as Text).data, "#d44136");
    expect(currentColor, ColorIs(targetColor));
    expect(controller.color, ColorIs(targetColor));
    expect(centerColor(), ColorIs(targetColor));
    expect(
        thumbColor(lightnessThumb),
        ColorIs(HSLColor.fromColor(targetColor)
            .withAlpha(1.0)
            .withSaturation(1.0)
            .toColor()));
    expect(
        thumbColor(hueThumb),
        ColorIs(HSLColor.fromColor(targetColor)
            .withAlpha(1.0)
            .withSaturation(1.0)
            .withLightness(0.5)
            .toColor()));
  });

  testWidgets('drag hue', (WidgetTester tester) async {
    Color currentColor = Colors.blue;
    final controller = CircleColorPickerController(initialColor: currentColor);

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CircleColorPicker(
          controller: controller,
          onChanged: (color) => {currentColor = color},
        ),
      ),
    );

    await tester.drag(find.byKey(const Key('hue')), Offset(100, 100));
    await tester.pump();

    final targetColor = Color(0xff5af321);
    expect(
        (find.byType(Text).evaluate().single.widget as Text).data, "#5af321");
    expect(currentColor, ColorIs(targetColor));
    expect(controller.color, ColorIs(targetColor));
    expect(centerColor(), ColorIs(targetColor));
    expect(thumbColor(lightnessThumb),
        ColorIs(HSLColor.fromColor(targetColor).withSaturation(1.0).toColor()));
    expect(
        thumbColor(hueThumb),
        ColorIs(HSLColor.fromColor(targetColor)
            .withSaturation(1.0)
            .withLightness(0.5)
            .toColor()));
  });

  testWidgets('drag lightness', (WidgetTester tester) async {
    Color currentColor = Colors.blue;
    final controller = CircleColorPickerController(initialColor: currentColor);

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CircleColorPicker(
          controller: controller,
          onChanged: (color) => {currentColor = color},
        ),
      ),
    );

    await tester.drag(find.byKey(const Key('lightness')), Offset(-30, 0));
    await tester.pump();

    final targetColor = Color(0xff085a9a);
    expect(
        (find.byType(Text).evaluate().single.widget as Text).data, "#085a9a");
    expect(currentColor, ColorIs(targetColor));
    expect(controller.color, ColorIs(targetColor));
    expect(centerColor(), ColorIs(targetColor));
    expect(thumbColor(lightnessThumb),
        ColorIs(HSLColor.fromColor(targetColor).withSaturation(1.0).toColor()));
    expect(
        thumbColor(hueThumb),
        ColorIs(HSLColor.fromColor(targetColor)
            .withSaturation(1.0)
            .withLightness(0.5)
            .toColor()));
  });
}
