#import "ElementScroll.h"

@implementation ElementScroll {
    BOOL _isContentViewWidthFixed;
    NSView *_contentView;
    NSView *_centerView;
}

- (instancetype)initWithFrame:(NSRect)frameRect isContentViewWidthFixed:(BOOL)isFixed {
    self = [super initWithFrame:frameRect];
    if (self) {

        _isContentViewWidthFixed = isFixed;

        [self setWantsLayer:YES];
        [self setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        [self setHasHorizontalScroller:YES];
        [self setHasVerticalScroller:YES];
        [self setAutohidesScrollers:YES];
        [self setBorderType:NSNoBorder];

        _contentView = [[NSView alloc] initWithFrame:self.bounds];
        _centerView = [[NSView alloc] initWithFrame:self.bounds];
        [_contentView addSubview:_centerView];
        [self setDocumentView:_contentView];
    }
    return self;
}

- (void)setFrame:(NSRect)frame {

    //CGFloat oldFrameHeight = self.frame.size.height;
    //CGFloat oldContentViewHeight = _contentView.frame.size.height;
    //CGFloat oldThumbHeight = MAX(oldFrameHeight * (oldFrameHeight / oldContentViewHeight), 25);
    [super setFrame:frame];
    [self updateContents];

/*
    CGFloat newFrameHeight = frame.size.height;
    CGFloat newContentViewHeight = _contentView.frame.size.height;
    CGFloat newThumbHeight = MAX(newFrameHeight * (newFrameHeight / newContentViewHeight), 25);

    CGFloat scrollY = self.contentView.bounds.origin.y;
    CGFloat diff = (newThumbHeight - oldThumbHeight);
    if (oldThumbHeight > newThumbHeight) {
        scrollY -= diff;
    } else {
        scrollY += diff;
    }

    [self.contentView scrollToPoint:NSMakePoint(0, scrollY)];*/
}

- (void)addContentView:(NSView *)view {

    [_centerView addSubview:view];
    [self updateContents];

    CGPoint newScrollOrigin = CGPointMake(0.0, _contentView.frame.size.height - self.contentView.bounds.size.height);
    [self.contentView scrollToPoint:newScrollOrigin];
}

- (NSUInteger)numberOfViews {
    return [_centerView.subviews count];
}

- (NSView *)getViewAtIndex:(NSInteger)index {
    return [_centerView.subviews objectAtIndex:index];
}

- (void)updateContents {

    CGFloat totalHeight = 0;
    CGFloat totalWidth = 0;

    for (NSView *view in _centerView.subviews) {
        NSRect frame = view.frame;
        totalHeight += frame.size.height;
        totalWidth = MAX(totalWidth, frame.size.width);
    }

    CGFloat xOffset = 0.0;
    CGFloat boundsWidth = self.bounds.size.width;

    if (_isContentViewWidthFixed) {

        totalWidth = boundsWidth;
        
    } else if (totalWidth < boundsWidth) {

        xOffset = (boundsWidth - totalWidth) / 2.0;
        totalWidth = boundsWidth;

    } else {

        xOffset = 10;
        totalWidth += 20;
    }

    CGFloat visibleHeight = MAX(self.bounds.size.height, totalHeight);
    [_centerView setFrame:NSMakeRect(xOffset, 0, totalWidth, visibleHeight)];
    [_contentView setFrameSize:NSMakeSize(totalWidth, visibleHeight)];

    CGFloat yPosition = visibleHeight;
    for (NSView *view in _centerView.subviews) {
        NSRect frame = view.frame;
        yPosition -= frame.size.height;
        frame.origin.y = yPosition;
        [view setFrame:frame];
    }
}

@end
