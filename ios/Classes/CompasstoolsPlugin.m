#import "CompasstoolsPlugin.h"
#import <compasstools/compasstools-Swift.h>

@implementation CompasstoolsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCompasstoolsPlugin registerWithRegistrar:registrar];
}
@end
