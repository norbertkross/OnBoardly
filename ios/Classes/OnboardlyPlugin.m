#import "OnboardlyPlugin.h"
#if __has_include(<onboardly/onboardly-Swift.h>)
#import <onboardly/onboardly-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "onboardly-Swift.h"
#endif

@implementation OnboardlyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftOnboardlyPlugin registerWithRegistrar:registrar];
}
@end
