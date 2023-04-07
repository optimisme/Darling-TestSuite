#import <AppKit/AppKit.h>

#import "TestNSImageView.h"
#import "TestNSButton.h"
#import "TestNSTextField.h"

@interface ViewSplitContents : NSView

- (instancetype)initWithFrame:(NSRect)frameRect;
- (void)showViewWithName:(NSString *)name;

@end