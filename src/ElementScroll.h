#import <AppKit/AppKit.h>

@interface ElementScroll : NSScrollView

- (instancetype)initWithFrame:(NSRect)frameRect isContentViewWidthFixed:(BOOL)isFixed;
- (void)addContentView:(NSView *)view;
- (NSUInteger)numberOfViews;
- (NSView *)getViewAtIndex:(NSInteger)index;

@end