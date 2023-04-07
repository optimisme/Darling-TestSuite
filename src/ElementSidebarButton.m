#include "ElementSidebarButton.h"

@implementation ElementSidebarButton

- (instancetype)initWithFrame:(NSRect)frameRect title:(NSString *)title {
    self = [super initWithFrame:frameRect];
    if (self) {

        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        [style setAlignment:NSTextAlignmentLeft];
        [style setLineBreakMode:NSLineBreakByTruncatingTail];
        [style setFirstLineHeadIndent:10.0];

        NSDictionary *attributes = @{
                                    NSForegroundColorAttributeName: [NSColor blackColor],
                                    NSFontAttributeName: [NSFont systemFontOfSize:13.0],
                                    NSParagraphStyleAttributeName: style
                                    };

        NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attributes];

        [self setAttributedTitle:attributedTitle];

        [self setButtonType:NSButtonTypeMomentaryChange];
        [self setAutoresizingMask:NSViewWidthSizable];
        [self setBordered:NO];
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];

    NSRect bounds = [self bounds];

    if (_selected) {
        // Draw highlight background
        NSBezierPath *backgroundPath = [NSBezierPath bezierPathWithRoundedRect:bounds xRadius:5.0 yRadius:5.0];
        [[NSColor colorWithCalibratedWhite:0.5 alpha:0.3] setFill];
        [backgroundPath fill];

        // Draw highlight border
        NSBezierPath *borderPath = [NSBezierPath bezierPathWithRoundedRect:NSInsetRect(bounds, 1.5, 1.5) xRadius:5.0 yRadius:5.0];
        [[NSColor colorWithCalibratedWhite:0.8 alpha:0.5] setStroke];
        [borderPath setLineWidth:1.0];
        [borderPath stroke];
    }
}
@end
