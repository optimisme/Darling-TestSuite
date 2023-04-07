#import "ViewSplitContents.h"

@implementation ViewSplitContents { 
    NSView *_contentView;
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        [self setWantsLayer:YES];
        [self.layer setBackgroundColor:[[NSColor redColor] CGColor]];

        // Add shadow
        [self setWantsLayer:YES];
        [self.layer setMasksToBounds:NO];
        [self.layer setShadowColor:[[NSColor blackColor] CGColor]];
        [self.layer setShadowOpacity:0.5];
        [self.layer setShadowOffset:CGSizeMake(0, 0)];
        [self.layer setShadowRadius:2.5];
      
        _contentView = [[TestNSTextField alloc] initWithFrame:self.bounds];
        [_contentView setHidden:NO];
        [self addSubview:_contentView];
    }
    return self;
}

- (void)setFrame:(NSRect)frame {
    [super setFrame:frame];
    [_contentView setFrame:self.bounds];
}

- (void)showViewWithName:(NSString *)name {

    NSView *tmpView = nil;
    
    // Remove all subviews
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    // Create the view
    if ([name isEqualToString:@"NSTextField"]) {

        tmpView = [[TestNSTextField alloc] initWithFrame:self.bounds];

    } else if ([name isEqualToString:@"NSButton"]) {

        tmpView = [[TestNSButton alloc] initWithFrame:self.bounds];

    } else if ([name isEqualToString:@"NSImageView"]) {

        tmpView = [[TestNSImageView alloc] initWithFrame:self.bounds];

    }

    if (tmpView != nil) {
        _contentView = tmpView;
        [_contentView setHidden:NO];
        [self addSubview:_contentView];
    }
}

@end

