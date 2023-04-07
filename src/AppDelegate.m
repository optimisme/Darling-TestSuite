#import "AppDelegate.h"
#import "ElementScroll.h"

@implementation AppDelegate {

    NSWindow *_window;

    AppMenu *_menu;
    ViewSplit *_splitView;
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification {

    // Define menu
    _menu = [[AppMenu alloc] init];
    [NSApp setMainMenu:_menu];

    // Define window
    NSRect windowRect = NSMakeRect(0, 0, 1024, 600);
    _window = [[NSWindow alloc] initWithContentRect:windowRect
                                         styleMask:(NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable)
                                           backing:NSBackingStoreBuffered
                                             defer:NO];
    [_window center];
    [_window makeKeyAndOrderFront:nil];

    // Define _splitView as window's main content view
    NSView *windowContentView = [_window contentView];
    [windowContentView setWantsLayer:YES];

    _splitView = [[ViewSplit alloc] initWithFrame:windowContentView.bounds appDelegate:self];
    [windowContentView addSubview:_splitView];

    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowDidResize:) name:NSWindowDidResizeNotification object:nil];
    [NSApp activateIgnoringOtherApps:YES];
}

- (void)menuItemSelected:(NSMenuItem *)menuItem {
    NSLog(@"Menu item selected: %@", menuItem.title);
}


- (void)applicationDidBecomeActive:(NSNotification *)notification {
    [_splitView applicationDidBecomeActive:notification];
}

- (void)applicationDidResignActive:(NSNotification *)notification {
    [_splitView applicationDidResignActive:notification];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

- (void)windowDidResize:(NSNotification *)notification {
    NSRect windowRect = [[[notification object] contentView] frame];
    [_splitView windowDidResize:notification];
}

- (void)showViewWithName:(NSString *)name {
    [_splitView showViewWithName:name];
}

@end
