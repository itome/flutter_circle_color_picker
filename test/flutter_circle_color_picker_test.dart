import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_circle_color_picker');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterCircleColorPicker.platformVersion, '42');
  });
}
