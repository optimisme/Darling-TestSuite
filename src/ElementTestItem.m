#import "ElementTestItem.h"

@implementation ElementTestItem { }

- (instancetype)initWithView:(NSView *)view andName:(NSString *)name andDescription:(NSString *)description {
    NSRect frame = NSMakeRect(0, 0, 750,  view.frame.size.height + 50);
    self = [super initWithFrame:frame];
    if (self) {

        CGFloat width = frame.size.width;
        CGFloat widthHalf = width / 2;
        CGFloat xEngine = 0;
        CGFloat xDescription = xEngine + widthHalf;
        CGFloat heightTitle = 18;
        CGFloat yTitle = frame.size.height - heightTitle;
        CGFloat yTest = 10;
        CGFloat height = frame.size.height;
        CGFloat heightHalf = height / 2;

        NSTextField *viewDescription = [[NSTextField alloc] initWithFrame:NSMakeRect(xEngine, yTitle, widthHalf - 1, heightTitle)];
        [viewDescription setStringValue:description];
        [viewDescription setEditable:NO];
        [viewDescription setBordered:NO];
        [viewDescription setFont:[NSFont systemFontOfSize:14]];
        [self addSubview:viewDescription];

        NSTextField *viewName = [[NSTextField alloc] initWithFrame:NSMakeRect(xDescription, yTitle, widthHalf + 1, heightTitle)];
        [viewName setStringValue:name];
        [viewName setEditable:NO];
        [viewName setBordered:NO];
        [viewName setFont:[NSFont systemFontOfSize:12]];
        [self addSubview:viewName];

        NSView *viewTest = view;
        CGFloat realWidth = widthHalf -1;
        if (view.frame.size.width < realWidth) {
            realWidth = view.frame.size.width;
        }
        [viewTest setFrame:NSMakeRect(xEngine, yTest, realWidth, view.frame.size.height)];
        [self addSubview:viewTest];

        NSRect testFrame = NSMakeRect(xDescription, yTest, viewTest.bounds.size.width, viewTest.bounds.size.height);
        if (viewTest != nil) {

            NSString *filePath = [[@"./TestSuite.app/Resources/" stringByAppendingString:name] stringByAppendingString:@".png"];
            
            if (kSaveImages && !isRunningOnDarling()) {
                [self saveViewAsImage:viewTest filePath:filePath];
            }   

            NSImage *image = [[NSImage alloc] initWithContentsOfFile:filePath];
            NSImageView *imageView = [[NSImageView alloc] initWithFrame:testFrame];
            [imageView setImage:image];
            [self addSubview:imageView];

        }
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self backDrawings];
}

- (void)backDrawings { 
    NSBezierPath *linePathH = [NSBezierPath bezierPath];
    [linePathH moveToPoint:NSMakePoint(0, 1)];
    [linePathH lineToPoint:NSMakePoint(self.bounds.size.width, 1)];
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

BOOL isRunningOnDarling() {
    NSString *desktop = [[[NSProcessInfo processInfo] environment] objectForKey:@"DESKTOP_SESSION"];
    return desktop != nil;
}

- (void)saveViewAsImage:(NSView *)viewTest filePath:(NSString *)filePath {

    NSBitmapImageRep *imageRep = [viewTest bitmapImageRepForCachingDisplayInRect:viewTest.bounds];
    [viewTest cacheDisplayInRect:viewTest.bounds toBitmapImageRep:imageRep];

    NSData *imageData = [imageRep representationUsingType:NSBitmapImageFileTypePNG properties:@{}];
    [imageData writeToFile:filePath atomically:YES];
}

@end