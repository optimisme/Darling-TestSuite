#import "ViewSplit.h"
#import "ViewSplitSidebar.h"
#import "ViewSplitContents.h"

@implementation ViewSplit {
    ViewSplitSidebar *_sidebarView;
    ViewSplitContents *_contentsView;
}

- (instancetype)initWithFrame:(NSRect)frameRect appDelegate:(AppDelegate *)appDelegate {
    self = [super initWithFrame:frameRect];
    if (self) {
        CGFloat sideWidth = 200;

        [self.layer setBackgroundColor:[[NSColor blackColor] CGColor]];

        [self setWantsLayer:YES];
        [self setAutoresizingMask: NSViewWidthSizable | NSViewHeightSizable];
        [self setVertical:YES];
        [self setDividerStyle:NSSplitViewDividerStyleThin];

        _sidebarView = [[ViewSplitSidebar alloc] initWithFrame:NSMakeRect(0, 0, sideWidth, CGRectGetHeight(self.frame)) appDelegate:appDelegate];
        [self addSubview:_sidebarView];
        // TDODO : addArrangedSubview does not work on Darling
        // [self addArrangedSubview:_sidebarView];

        _contentsView = [[ViewSplitContents alloc] initWithFrame:NSMakeRect(0, 0, CGRectGetWidth(self.frame) - sideWidth, CGRectGetHeight(self.frame))];
        [self addSubview:_contentsView];
        // TDODO : addArrangedSubview does not work on Darling
        // [self addArrangedSubview:_contentsView];
    }
    return self;
}

- (void)applicationDidBecomeActive:(NSNotification *)notification {
    [_sidebarView updateBackgroundColorWithFocus:YES];
}

- (void)applicationDidResignActive:(NSNotification *)notification {
    [_sidebarView updateBackgroundColorWithFocus:NO];
}

- (void)windowDidResize:(NSNotification *)notification {
    // Mandatory function, even if empty
}

- (void)showViewWithName:(NSString *)name {
    [_contentsView showViewWithName:name];
}

@end