#import "ViewSplitSidebar.h"

@implementation ViewSplitSidebar {
    AppDelegate *_appDelegate;
    ElementScroll *_scroll;
}

- (instancetype)initWithFrame:(NSRect)frameRect appDelegate:(AppDelegate *)appDelegate {
    self = [super initWithFrame:frameRect];
    if (self) {
        _appDelegate = appDelegate;

        [self setWantsLayer:YES];
        [self.layer setBackgroundColor:[kColorBlur CGColor]];

        [self setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];

        _scroll = [[ElementScroll alloc] initWithFrame:frameRect isContentViewWidthFixed:YES];
        [self addSubview:_scroll];

        [self createButtonsWithTitles];
    }
    return self;
}

- (void)createButtonsWithTitles {

    // Empty space at the top
    ElementEmpty *emptyTop = [[ElementEmpty alloc] initWithHeight:10];
    [_scroll addContentView:emptyTop];

    for (NSString *title in kSidebarTitles) {
        NSRect frame = NSMakeRect(kButtonMargin, 0, CGRectGetWidth(self.frame) - kButtonMargin * 2, kButtonHeight);
        ElementSidebarButton *button = [[ElementSidebarButton alloc] initWithFrame:frame title:title];
        [button setTarget:self];
        [button setAction:@selector(showViewWithNameFromButton:)];
        [_scroll addContentView:button];
    }

    if ([_scroll numberOfViews] > 1) {
        ElementSidebarButton *button = (ElementSidebarButton *)[_scroll getViewAtIndex:1];
        [button setSelected:YES];
    }

    // Empty space at the bottom
    ElementEmpty *emptyBottom = [[ElementEmpty alloc] initWithHeight:10];
    [_scroll addContentView:emptyBottom];
}

- (void)updateBackgroundColorWithFocus:(BOOL)hasFocus {
    NSColor *customColor = hasFocus ? kColorFocus : kColorBlur;
    [_scroll.contentView setBackgroundColor:customColor];
}

- (void)showViewWithNameFromButton:(NSButton *)button {
    NSString *title = button.title;
    [self updateButtonSelectionWithTitle:title];
    [_appDelegate showViewWithName:title];
}

- (void)updateButtonSelectionWithTitle:(NSString *)title {

    NSUInteger numberOfViews = [_scroll numberOfViews];
    for (NSInteger i = 0; i < numberOfViews; i++) {
        NSView *view = [_scroll getViewAtIndex:i];
        if ([view isKindOfClass:[ElementSidebarButton class]]) {
            ElementSidebarButton *button = (ElementSidebarButton *) view;
            if ([[button title] isEqualToString:title]) {
                [button setSelected:YES];
            } else {
                [button setSelected:NO];
            }
        }
    }
}

@end
