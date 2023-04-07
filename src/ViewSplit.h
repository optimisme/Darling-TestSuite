#import <AppKit/AppKit.h>

@class AppDelegate; // Forward declaration of the AppDelegate class to avoid circular dependencies

@interface ViewSplit : NSSplitView

- (instancetype)initWithFrame:(NSRect)frameRect appDelegate:(AppDelegate *)appDelegate;
- (void)applicationDidBecomeActive:(NSNotification *)notification;
- (void)applicationDidResignActive:(NSNotification *)notification;
- (void)windowDidResize:(NSNotification *)notification;
- (void)showViewWithName:(NSString *)name;

@end