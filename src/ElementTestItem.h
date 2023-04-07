#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

#define kSaveImages YES

@interface ElementTestItem : NSView

- (instancetype)initWithView:(NSView *)view andName:(NSString *)name andDescription:(NSString *)description;

@end