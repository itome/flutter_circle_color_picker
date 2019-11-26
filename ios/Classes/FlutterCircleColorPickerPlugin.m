#import "FlutterCircleColorPickerPlugin.h"
#if __has_include(<flutter_circle_color_picker/flutter_circle_color_picker-Swift.h>)
#import <flutter_circle_color_picker/flutter_circle_color_picker-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_circle_color_picker-Swift.h"
#endif

@implementation FlutterCircleColorPickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterCircleColorPickerPlugin registerWithRegistrar:registrar];
}
@end
