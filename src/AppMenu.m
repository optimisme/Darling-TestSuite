#import "AppMenu.h"

@implementation AppMenu { }

- (instancetype)init {
    self = [super initWithTitle:@"MainMenu"];
    if (self) {
        NSString *appName = [[NSProcessInfo processInfo] processName];
        NSMenuItem *mainMenuItem = [[NSMenuItem alloc] initWithTitle:appName action:nil keyEquivalent:@""];
        NSMenu *appMenu = [[NSMenu alloc] initWithTitle:@"Application"];
        NSMenuItem *appMenuItemQuit = [[NSMenuItem alloc] initWithTitle:@"Quit" action:@selector(terminate:) keyEquivalent:@"q"];

        [self addItem:mainMenuItem];
        [mainMenuItem setSubmenu:appMenu];
        [appMenu addItem:appMenuItemQuit];
    }
    return self;
}

@end