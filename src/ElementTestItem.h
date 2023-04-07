#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

#define kSaveImages NO

@interface ElementTestItem : NSView

- (instancetype)initWithView:(NSView *)view andName:(NSString *)name andDescription:(NSString *)description;

@end