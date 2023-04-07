#import "ElementEmpty.h"

@implementation ElementEmpty { }

- (instancetype)initWithHeight:(CGFloat)height {
    NSRect frame = NSMakeRect(0, 0, 10,  height);
    self = [super initWithFrame:frame];
    return self;
}

@end