#import <AppKit/AppKit.h>

@interface ElementSidebarButton : NSButton

@property (nonatomic, getter=isSelected) BOOL selected;

- (instancetype)initWithFrame:(NSRect)frameRect title:(NSString *)title;

@end