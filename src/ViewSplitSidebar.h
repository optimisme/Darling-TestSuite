#import <AppKit/AppKit.h>

#import "AppDelegate.h"
#import "ElementEmpty.h"
#import "ElementScroll.h"
#import "ElementSidebarButton.h"

//#define kSidebarTitles @[@"Label", @"Image"]
#define kSidebarTitles @[@"NSTextField", @"NSButton", @"NSImageView"]
#define kButtonMargin 10.0
#define kButtonHeight 30.0
#define kColorFocus [NSColor colorWithSRGBRed:231.0/255.0 green:224.0/255.0 blue:220.0/255.0 alpha:1.0]
#define kColorBlur [NSColor colorWithSRGBRed:237.0/255.0 green:230.0/255.0 blue:227.0/255.0 alpha:0.5]

@interface ViewSplitSidebar : NSView

- (instancetype)initWithFrame:(NSRect)frameRect appDelegate:(AppDelegate *)appDelegate;

- (void)updateBackgroundColorWithFocus:(BOOL)hasFocus;
- (void)updateButtonSelectionWithTitle:(NSString *)title;

@end