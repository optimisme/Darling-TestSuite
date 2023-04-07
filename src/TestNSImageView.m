#import "TestNSImageView.h"

@implementation TestNSImageView {

    ElementScroll *_scroll;
    NSArray<NSDictionary *> *_tests;
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {

        _scroll = [[ElementScroll alloc] initWithFrame:frameRect isContentViewWidthFixed:NO];
        [self addSubview:_scroll];

        // Empty space at the top
        ElementEmpty *emptyTop = [[ElementEmpty alloc] initWithHeight:25];
        [_scroll addContentView:emptyTop];

        ElementTestsTitle *title = [[ElementTestsTitle alloc] init];
        [_scroll addContentView:title];

        // TODO: Text direction tests do not work on Darling
        _tests = @[
            @{@"name": @"NSImageViewTest00", @"description": @"Default image view"},
            @{@"name": @"NSImageViewTest01", @"description": @"Scale axes independently"},
            @{@"name": @"NSImageViewTest02", @"description": @"Scale proporitonally down (align left)"},
            @{@"name": @"NSImageViewTest03", @"description": @"Scale proporitonally up or down (align right)"},
            @{@"name": @"NSImageViewTest04", @"description": @"Frame style bezel"},
            @{@"name": @"NSImageViewTest05", @"description": @"Red tinted template image"}
        ];
        
        for (NSDictionary *test in _tests) {
            NSView *viewTest = [self addTestWithName:test[@"name"]];
            [_scroll addContentView:[[ElementTestItem alloc] initWithView:viewTest andName:test[@"name"] andDescription:test[@"description"]]];
        }
    }
    return self;
}

- (NSView*) addTestWithName:(NSString *)name {
    NSView *test = nil;
    
    if ([name isEqualToString:@"NSImageViewTest00"]) {

        test = [[NSImageView alloc] initWithFrame:NSMakeRect(50, 20, 200, 100)];
        [(NSImageView *) test setImage:[NSImage imageNamed:@"AppIcon.png"]];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSImageViewTest01"]) {

        test = [[NSImageView alloc] initWithFrame:NSMakeRect(50, 20, 200, 100)];
        [(NSImageView *) test setImage:[NSImage imageNamed:@"AppIcon.png"]];
        [(NSImageView *) test setImageScaling:NSImageScaleAxesIndependently];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSImageViewTest02"]) {

        test = [[NSImageView alloc] initWithFrame:NSMakeRect(50, 20, 200, 100)];
        [(NSImageView *) test setImage:[NSImage imageNamed:@"AppIcon.png"]];
        [(NSImageView *) test setImageScaling:NSImageScaleProportionallyDown];
        [(NSImageView *) test setImageAlignment:NSImageAlignLeft];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSImageViewTest03"]) {

        test = [[NSImageView alloc] initWithFrame:NSMakeRect(50, 20, 200, 100)];
        [(NSImageView *) test setImage:[NSImage imageNamed:@"AppIcon.png"]];
        [(NSImageView *) test setImageScaling:NSImageScaleProportionallyUpOrDown];
        [(NSImageView *) test setImageAlignment:NSImageAlignRight];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSImageViewTest04"]) {

        test = [[NSImageView alloc] initWithFrame:NSMakeRect(50, 20, 200, 100)];
        [(NSImageView *) test setImage:[NSImage imageNamed:@"AppIcon.png"]];
        [(NSImageView *) test setImageScaling:NSImageScaleProportionallyUpOrDown];
        [(NSImageView *) test setImageAlignment:NSImageAlignCenter];
        [(NSImageView *) test setImageFrameStyle:NSImageFrameGrayBezel];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSImageViewTest05"]) {

        test = [[NSImageView alloc] initWithFrame:NSMakeRect(50, 20, 200, 100)];

        // Carregar la imatge original i convertir-la en una imatge de plantilla
        NSImage *originalImage = [NSImage imageNamed:@"AppTemplate.png"];
        NSImage *templateImage = [originalImage copy];
        [templateImage setTemplate:YES];

        // Establir la imatge de plantilla, l'escalat i l'alineació
        [(NSImageView *)test setImage:templateImage];
        [(NSImageView *)test setImageScaling:NSImageScaleProportionallyUpOrDown];
        [(NSImageView *)test setImageAlignment:NSImageAlignCenter];

        // Aplicar el color de tinta a la imatge de plantilla
        [(NSImageView *)test setContentTintColor:[NSColor redColor]];

        [self addSubview:test];

    }

    return test;
}

- (void)acceptButtonClicked:(id)sender {
    NSLog(@"Accept button clicked");
}

- (void)cancelButtonClicked:(id)sender {
    NSLog(@"Cancel button clicked");
}

- (void)radioButtonSelected:(NSButton *)sender {
    for (NSButton *button in [sender.superview subviews]) {
        if ([button isKindOfClass:[NSButton class]] &&
            [button.identifier isEqualToString:sender.identifier]) {
            [button setState:NSControlStateValueOff];
        }
    }
    [sender setState:NSControlStateValueOn];
}

@end
