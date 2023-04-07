#import "TestNSTextField.h"

@implementation TestNSTextField {

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
            @{@"name": @"NSTextFieldTest00", @"description": @"Default label"},
            @{@"name": @"NSTextFieldTest01", @"description": @"Alignment center"},
            @{@"name": @"NSTextFieldTest02", @"description": @"Alignment right"},
            @{@"name": @"NSTextFieldTest03", @"description": @"Alignment justified"},
            @{@"name": @"NSTextFieldTest04", @"description": @"Text color"},
            @{@"name": @"NSTextFieldTest05", @"description": @"Background color"},
            @{@"name": @"NSTextFieldTest06", @"description": @"NSFont Arial"},
            @{@"name": @"NSTextFieldTest07", @"description": @"NSFont Courier New"},
            @{@"name": @"NSTextFieldTest08", @"description": @"NSFont Arial Bold"},
            @{@"name": @"NSTextFieldTest09", @"description": @"NSFont Courier New Italic"},
            @{@"name": @"NSTextFieldTest10", @"description": @"NSFont underlined"},
            @{@"name": @"NSTextFieldTest11", @"description": @"Head truncated text"},
            @{@"name": @"NSTextFieldTest12", @"description": @"Middle truncated text"},
            @{@"name": @"NSTextFieldTest13", @"description": @"Tail truncated text"},
            @{@"name": @"NSTextFieldTest14", @"description": @"Wrapped text"},
            @{@"name": @"NSTextFieldTest15", @"description": @"Wrapped text by character"},
            @{@"name": @"NSTextFieldTest16", @"description": @"Text direction natural"},
            @{@"name": @"NSTextFieldTest17", @"description": @"Text direction left to right"},
            @{@"name": @"NSTextFieldTest18", @"description": @"Text direction right to left"},
            @{@"name": @"NSTextFieldTest19", @"description": @"Editable text field"},
            @{@"name": @"NSTextFieldTest20", @"description": @"Editable text type password"}
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
    NSString *loremIpsum = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
    
    if ([name isEqualToString:@"NSTextFieldTest00"]) {

        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 25)];
        [(NSTextField *)test setStringValue:@"Hello"];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];

    } else if ([name isEqualToString:@"NSTextFieldTest01"]) {

        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 25)];
        [(NSTextField *)test setStringValue:@"Hello"];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        [(NSTextField *)test setAlignment:NSTextAlignmentCenter];

    } else if ([name isEqualToString:@"NSTextFieldTest02"]) {

        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 25)];
        [(NSTextField *)test setStringValue:@"Hello"];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        [(NSTextField *)test setAlignment:NSTextAlignmentRight];

    } else if ([name isEqualToString:@"NSTextFieldTest03"]) {

        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 250, 50)];
        [(NSTextField *)test setStringValue:loremIpsum];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        [(NSTextField *)test setAlignment:NSTextAlignmentJustified];

    } else if ([name isEqualToString:@"NSTextFieldTest04"]) {

        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 25)];
        [(NSTextField *)test setStringValue:@"Text color"];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        [(NSTextField *)test setTextColor:[NSColor blueColor]];
        [(NSTextField *)test setAlignment:NSTextAlignmentCenter];
        
    } else if ([name isEqualToString:@"NSTextFieldTest05"]) {

        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 25)];
        [(NSTextField *)test setStringValue:@"Background color"];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        [(NSTextField *)test setBackgroundColor:[NSColor lightGrayColor]];
        [(NSTextField *)test setAlignment:NSTextAlignmentCenter];
    } else if ([name isEqualToString:@"NSTextFieldTest06"]) {

        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 25)];
        [(NSTextField *)test setStringValue:@"NSFont Arial"];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        [(NSTextField *)test setFont:[NSFont fontWithName:@"Arial" size:12]];
        [(NSTextField *)test setAlignment:NSTextAlignmentCenter];
    } else if ([name isEqualToString:@"NSTextFieldTest07"]) {

        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 25)];
        [(NSTextField *)test setStringValue:@"NSFont Helvetica"];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        [(NSTextField *)test setFont:[NSFont fontWithName:@"Courier New" size:12]];
        [(NSTextField *)test setAlignment:NSTextAlignmentCenter];
    } else if ([name isEqualToString:@"NSTextFieldTest08"]) {

        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 25)];
        [(NSTextField *)test setStringValue:@"NSFont Arial Bold"];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        NSFontDescriptor *descriptor = [[NSFontDescriptor alloc] initWithFontAttributes:
                                    @{NSFontNameAttribute: @"Arial-BoldMT",
                                      NSFontSizeAttribute: @12}];
        NSFont *font = [NSFont fontWithDescriptor:descriptor size:0];
        [(NSTextField *)test setFont:font];
        [(NSTextField *)test setAlignment:NSTextAlignmentCenter];
    } else if ([name isEqualToString:@"NSTextFieldTest09"]) {

        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 25)];
        [(NSTextField *)test setStringValue:@"NSFont Courier New Italic"];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        NSFontDescriptor *descriptor = [[NSFontDescriptor alloc] initWithFontAttributes:
                                            @{NSFontNameAttribute: @"CourierNewPS-ItalicMT",
                                            NSFontSizeAttribute: @12}];
        NSFont *font = [NSFont fontWithDescriptor:descriptor size:0];
        [(NSTextField *)test setFont:font];
        [(NSTextField *)test setAlignment:NSTextAlignmentCenter];
    } else if ([name isEqualToString:@"NSTextFieldTest10"]) {

        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 25)];
        [(NSTextField *)test setStringValue:@"Hello"];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setAlignment:NSTextAlignmentCenter];

        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"Underlined!" attributes:@{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle), NSParagraphStyleAttributeName: paragraphStyle}];

        [(NSTextField *)test setAttributedStringValue:attributedString];
        [(NSTextField *)test setAlignment:NSTextAlignmentCenter];
    } else if ([name isEqualToString:@"NSTextFieldTest11"]) {

        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 25)];
        [(NSTextField *)test setStringValue:[loremIpsum stringByAppendingString:@": Head truncated text."]];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        [(NSTextField *)test setLineBreakMode:NSLineBreakByTruncatingHead];

    } else if ([name isEqualToString:@"NSTextFieldTest12"]) {

        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 25)];
        [(NSTextField *)test setStringValue:[@"Middle truncated text: " stringByAppendingString:loremIpsum]];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        [(NSTextField *)test setLineBreakMode:NSLineBreakByTruncatingMiddle];

    } else if ([name isEqualToString:@"NSTextFieldTest13"]) {

        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 25)];
        [(NSTextField *)test setStringValue:[@"Tail truncated text: " stringByAppendingString:loremIpsum]];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        [(NSTextField *)test setLineBreakMode:NSLineBreakByTruncatingTail];

    } else if ([name isEqualToString:@"NSTextFieldTest14"]) {

        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 50)];
        [(NSTextField *)test setStringValue:[@"Wrapped text: " stringByAppendingString:loremIpsum]];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        [(NSTextField *)test setLineBreakMode:NSLineBreakByWordWrapping];
        [(NSTextField *)test setAutoresizingMask:NSViewHeightSizable];
        [(NSTextField *)test setUsesSingleLineMode:NO];

    } else if ([name isEqualToString:@"NSTextFieldTest15"]) {

        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 50)];
        [(NSTextField *)test setStringValue:[@"Wrapped text: " stringByAppendingString:loremIpsum]];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        [(NSTextField *)test setLineBreakMode:NSLineBreakByCharWrapping];
        [(NSTextField *)test setAutoresizingMask:NSViewHeightSizable];
        [(NSTextField *)test setUsesSingleLineMode:NO];
    } else if ([name isEqualToString:@"NSTextFieldTest16"]) {
// TODO: This example crashes Darling
/*
        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 50)];
        [(NSTextField *)test setStringValue:[@"Text direction natural: " stringByAppendingString:loremIpsum]];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        [(NSTextField *)test setAutoresizingMask:NSViewHeightSizable];
        [(NSTextField *)test setUsesSingleLineMode:NO];
        [(NSTextField *)test setBaseWritingDirection:NSWritingDirectionNatural];
*/
    } else if ([name isEqualToString:@"NSTextFieldTest17"]) {
// TODO: This example crashes Darling
/*
        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 50)];
        [(NSTextField *)test setStringValue:[@"Text direction left to right: " stringByAppendingString:loremIpsum]];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        [(NSTextField *)test setAutoresizingMask:NSViewHeightSizable];
        [(NSTextField *)test setUsesSingleLineMode:NO];
        [(NSTextField *)test setBaseWritingDirection:NSWritingDirectionLeftToRight];
*/
    } else if ([name isEqualToString:@"NSTextFieldTest18"]) {
// TODO: This example crashes Darling
/*
        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 350, 50)];
        [(NSTextField *)test setStringValue:@"פסקה זו היא לאמצע הטקסט, אלא מקום מצוין להכניס לפה טקסט דמוי-טקסט לתכליתי לראות איך יוצגו צבעים, גופנים, גדלים וכיו"];
        [(NSTextField *)test setEditable:NO];
        [(NSTextField *)test setBordered:NO];
        [(NSTextField *)test setAlignment:NSTextAlignmentRight];
        [(NSTextField *)test setBaseWritingDirection:NSWritingDirectionRightToLeft];
*/
    } else if ([name isEqualToString:@"NSTextFieldTest19"]) {

        test = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSTextField *)test setStringValue:@"Editable field"];
        [(NSTextField *)test setEditable:YES];
        [(NSTextField *)test setBordered:YES];

    } else if ([name isEqualToString:@"NSTextFieldTest20"]) {

        test = [[NSSecureTextField alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSTextField *)test setStringValue:@"Editable"];
        [(NSTextField *)test setEditable:YES];
        [(NSTextField *)test setBordered:YES];

    }
    
    return test;
}

@end
