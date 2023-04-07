#import "ElementTestsTitle.h"

@implementation ElementTestsTitle { }

- (instancetype)init {
    NSRect frame = NSMakeRect(0, 0, 750,  50);
    self = [super initWithFrame:frame];
    if (self) {

        CGFloat width = frame.size.width;
        CGFloat widthHalf = width / 2;
        CGFloat xEngine = 0;
        CGFloat xImage = xEngine + widthHalf;
        CGFloat height = frame.size.height;
        CGFloat heightHalf = height / 2;

        NSTextField *viewEngine = [[NSTextField alloc] initWithFrame:NSMakeRect(xEngine, heightHalf, widthHalf - 1, heightHalf)];
        [viewEngine setStringValue:@"Drawing engine:"];
        [viewEngine setEditable:NO];
        [viewEngine setBordered:NO];
        [viewEngine setFont:[NSFont systemFontOfSize:18]];
        [self addSubview:viewEngine];

        NSTextField *viewImage = [[NSTextField alloc] initWithFrame:NSMakeRect(xImage, heightHalf, widthHalf + 1, heightHalf)];
        [viewImage setStringValue:@"OSX Screenshot:"];
        [viewImage setEditable:NO];
        [viewImage setBordered:NO];
        [viewImage setFont:[NSFont systemFontOfSize:18]];
        [self addSubview:viewImage];

        // TODO: This way of adding graphics does not work on Darling (see getDrawings comments)
        //NSView *drawings = [[NSView alloc] initWithFrame:frame];
        //[drawings setWantsLayer:YES];
        //[drawings setLayer:[self getDrawings:NSMakeRect(0, 0, width, height)]];
        //[self addSubview:drawings];
    }
    return self;
}

// Draw direclty on view background, redrawis automatically
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self backDrawings];
}

- (void)backDrawings {
    NSBezierPath *linePathH = [NSBezierPath bezierPath];
    [linePathH moveToPoint:NSMakePoint(0, 15)];
    [linePathH lineToPoint:NSMakePoint(self.bounds.size.width, 15)];
    [linePathH setLineWidth:1.0];
    [[NSColor lightGrayColor] setStroke];
    [linePathH stroke];
    
    CGFloat halfWidth = (self.bounds.size.width / 2) - 0.5;
    NSBezierPath *linePathV = [NSBezierPath bezierPath];
    [linePathV moveToPoint:NSMakePoint(halfWidth, 0)];
    [linePathV lineToPoint:NSMakePoint(halfWidth, self.bounds.size.height)];
    [linePathV setLineWidth:1.0];
    [[NSColor lightGrayColor] setStroke];
    [linePathV stroke];
}
/*

- (CALayer *)getDrawings:(NSRect)frame {

    // TODO: Commented lines break DaringHQ, but not Xcode.

    CALayer *parentLayer = [CALayer layer];
    parentLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);

    CAShapeLayer *line1Layer = [CAShapeLayer layer];
    CGMutablePathRef line1Path = CGPathCreateMutable();
    //[line1Layer setStrokeColor:[[NSColor lightGrayColor] CGColor]];
    //[line1Layer setLineWidth:1.0];
    CGPathMoveToPoint(line1Path, NULL, frame.origin.x, 15.0);
    CGPathAddLineToPoint(line1Path, NULL, frame.size.width, 15.0);
    //[line1Layer setPath:line1Path];
    CGPathRelease(line1Path);
    [parentLayer addSublayer:line1Layer];

    CGFloat halfWidth = frame.size.width / 2;
    CAShapeLayer *line3Layer = [CAShapeLayer layer];
    CGMutablePathRef line3Path = CGPathCreateMutable();
    //[line3Layer setStrokeColor:[[NSColor lightGrayColor] CGColor]];
    //[line3Layer setLineWidth:0.5];
    CGPathMoveToPoint(line3Path, NULL, halfWidth, 0);
    CGPathAddLineToPoint(line3Path, NULL, halfWidth, 50);
    //[line3Layer setPath:line3Path];
    CGPathRelease(line3Path);
    [parentLayer addSublayer:line3Layer];

    return parentLayer;
}
*/
@end