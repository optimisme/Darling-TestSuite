
#import <AppKit/AppKit.h>
#import "AppDelegate.h"

// darling shell
// clang -lobjc -framework Foundation -framework AppKit -o TestSuite.app/TestSuite src/*.m
// ./TestSuite.app/TestSuite

int main(int argc, const char *argv[]) {
    @autoreleasepool {
      NSApplication *app = [NSApplication sharedApplication];
      AppDelegate *appDelegate = [[AppDelegate alloc] init];
      [app setDelegate:appDelegate];
      [app run];
    }
    return 0;
}