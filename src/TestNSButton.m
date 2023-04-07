#import "TestNSButton.h"

@implementation TestNSButton {

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
            @{@"name": @"NSButtonTest00", @"description": @"Default button"},
            @{@"name": @"NSButtonTest01", @"description": @"OSX button"},
            @{@"name": @"NSButtonTest02", @"description": @"Rounded button"},
            @{@"name": @"NSButtonTest03", @"description": @"Shadowless button"},
            @{@"name": @"NSButtonTest04", @"description": @"Circular button"},
            @{@"name": @"NSButtonTest05", @"description": @"Textured button"},
            @{@"name": @"NSButtonTest06", @"description": @"Help button"},
            @{@"name": @"NSButtonTest07", @"description": @"Small square button"},
            @{@"name": @"NSButtonTest08", @"description": @"Disclosure button"},
            @{@"name": @"NSButtonTest09", @"description": @"Accept button"},
            @{@"name": @"NSButtonTest10", @"description": @"Cancel button"},
            @{@"name": @"NSButtonTest11", @"description": @"Icon button"},
            @{@"name": @"NSButtonTest12", @"description": @"Checkbox"},
            @{@"name": @"NSButtonTest13", @"description": @"Checked Checkbox"},
            @{@"name": @"NSButtonTest14", @"description": @"Disabled Checkbox"},
            @{@"name": @"NSButtonTest15", @"description": @"Radio buttons"},
            @{@"name": @"NSButtonTest16", @"description": @"Recessed button"},
            @{@"name": @"NSButtonTest17", @"description": @"Inline button"},
            @{@"name": @"NSButtonTest18", @"description": @"Popup button"},
            @{@"name": @"NSButtonTest19", @"description": @"Combo button"},
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

    if ([name isEqualToString:@"NSButtonTest00"]) {

        test = [[NSButton alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSButton *) test setTitle:@"Button"];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSButtonTest01"]) {

        test = [[NSButton alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSButton *) test setBezelStyle:NSBezelStyleRegularSquare];
        [(NSButton *) test setTitle:@"Button"];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSButtonTest02"]) {

        test = [[NSButton alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSButton *) test setBezelStyle:NSBezelStyleRounded];
        [(NSButton *) test setTitle:@"Button"];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSButtonTest03"]) {

        test = [[NSButton alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSButton *) test setBezelStyle:NSBezelStyleShadowlessSquare];
        [(NSButton *) test setTitle:@"Button"];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSButtonTest04"]) {

        test = [[NSButton alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSButton *) test setBezelStyle:NSBezelStyleCircular];
        [(NSButton *) test setTitle:@"B"];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSButtonTest05"]) {

        test = [[NSButton alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSButton *) test setBezelStyle:NSBezelStyleTexturedSquare];
        [(NSButton *) test setTitle:@"Button"];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSButtonTest06"]) {

        test = [[NSButton alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSButton *) test setBezelStyle:NSBezelStyleHelpButton];
        [(NSButton *) test setTitle:@""];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSButtonTest07"]) {

        test = [[NSButton alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSButton *) test setBezelStyle:NSBezelStyleSmallSquare];
        [(NSButton *) test setTitle:@"Button"];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSButtonTest08"]) {

        test = [[NSButton alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSButton *) test setBezelStyle:NSBezelStyleDisclosure];
        [(NSButton *) test setTitle:@""];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSButtonTest09"]) {
// TODO : Does not work on Darling
/*
        test = [[NSButton alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSButton *) test setBezelStyle:NSBezelStyleRegularSquare];
        [(NSButton *) test setTitle:@"Accept"];
        [(NSButton *) test setButtonType:NSButtonTypeMomentaryPushIn];
        [(NSButton *) test setBordered:YES];
        [(NSButton *) test setEnabled:YES];
        [(NSButton *) test setTarget:self];
        [(NSButton *) test setAction:@selector(acceptButtonClicked:)];
        [(NSButton *) test setKeyEquivalent:@"\r"]; // Activarà el botó si es prem Return
        [(NSButton *) test setHighlighted:YES]; // Marcarà el botó com a predeterminat
        [self addSubview:test];
*/
    } else if ([name isEqualToString:@"NSButtonTest10"]) {
// TODO : Does not work on Darling
/*
        test = [[NSButton alloc] initWithFrame:NSMakeRect(160, 0, 100, 25)];
        [(NSButton *) test setBezelStyle:NSBezelStyleRegularSquare];
        [(NSButton *) test setTitle:@"Cancel"];
        [(NSButton *) test setButtonType:NSButtonTypeMomentaryPushIn];
        [(NSButton *) test setBordered:YES];
        [(NSButton *) test setEnabled:YES];
        [(NSButton *) test setTarget:self];
        [(NSButton *) test setAction:@selector(cancelButtonClicked:)];
        [(NSButton *) test setKeyEquivalent:@"\033"]; // Activarà el botó si es prem Esc
        [(NSButton *) test setAttributedTitle:[[NSAttributedString alloc] initWithString:@"Cancel" attributes:@{NSForegroundColorAttributeName: [NSColor systemRedColor]}]];
        [self addSubview:test];
*/
    } else if ([name isEqualToString:@"NSButtonTest11"]) {

        test = [[NSButton alloc] initWithFrame:NSMakeRect(50, 0, 75, 75)];
        [(NSButton *) test setBezelStyle:NSBezelStyleRegularSquare];
        [(NSButton *) test setTitle:@"Folder"];
        [(NSButton *) test setImage:[NSImage imageNamed:NSImageNameFolder]];
        [(NSButton *) test setButtonType:NSButtonTypeMomentaryPushIn];
        [(NSButton *) test setBordered:YES];
        [(NSButton *) test setEnabled:YES];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSButtonTest12"]) {

        test = [[NSButton alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSButton *) test setButtonType:NSButtonTypeSwitch];
        [(NSButton *) test setTitle:@"Option"];
        [[(NSButton *) test cell] setControlSize:NSControlSizeRegular];
        [(NSButton *) test setEnabled:YES];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSButtonTest13"]) {

        test = [[NSButton alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSButton *) test setButtonType:NSButtonTypeSwitch];
        [(NSButton *) test setTitle:@"Option"];
        [[(NSButton *) test cell] setControlSize:NSControlSizeRegular];
        [(NSButton *) test setState:YES];
        [(NSButton *) test setEnabled:YES];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSButtonTest14"]) {

        test = [[NSButton alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSButton *) test setButtonType:NSButtonTypeSwitch];
        [(NSButton *) test setTitle:@"Option"];
        [[(NSButton *) test cell] setControlSize:NSControlSizeRegular];
        [(NSButton *) test setState:YES];
        [(NSButton *) test setEnabled:NO];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSButtonTest15"]) {
// TODO : Does not work on Darling
/*
        NSButton *option1 = [[NSButton alloc] initWithFrame:NSMakeRect(0, 25, 100, 25)];
        [option1 setButtonType:NSButtonTypeRadio];
        [option1 setTitle:@"Option 1"];
        [option1 setEnabled:YES];
        [option1 setState:NSControlStateValueOn]; 
        [option1 setTarget:self];
        [option1 setAction:@selector(radioButtonSelected:)]; 

        NSButton *option2 = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 100, 25)];
        [option2 setButtonType:NSButtonTypeRadio];
        [option2 setTitle:@"Option 2"];
        [option2 setEnabled:YES];
        [option2 setTarget:self];
        [option2 setAction:@selector(radioButtonSelected:)];

        // Set group for radio buttons
        [option1 setAllowsMixedState:NO];
        [option2 setAllowsMixedState:NO];
        [option1 setState:NSControlStateValueOn];
        [option1 setIdentifier:@"group1"];
        [option2 setIdentifier:@"group1"];

        test = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 100, 50)];
        [test addSubview:option1];
        [test addSubview:option2];
        [self addSubview:test];
*/
    } else if ([name isEqualToString:@"NSButtonTest16"]) {

        test = [[NSButton alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSButton *) test setBezelStyle:NSBezelStyleRecessed];
        [(NSButton *) test setTitle:@"Recessed"];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSButtonTest17"]) {

        test = [[NSButton alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSButton *) test setBezelStyle:NSBezelStyleInline];
        [(NSButton *) test setTitle:@"Inline"];
        [self addSubview:test];
    } else if ([name isEqualToString:@"NSButtonTest18"]) {

        test = [[NSPopUpButton alloc] initWithFrame:NSMakeRect(50, 0, 100, 25)];
        [(NSPopUpButton *) test addItemsWithTitles:@[@"Gat", @"Gos", @"Ocell", @"Peix"]];
        [self addSubview:test];

    } else if ([name isEqualToString:@"NSButtonTest19"]) {
// TODO : Does not work on Darling
/*
        test = [[NSComboBox alloc] initWithFrame:NSMakeRect(50, 0, 150, 25)];
        [(NSComboBox *) test addItemsWithObjectValues:@[@"Gat", @"Gos", @"Ocell", @"Peix"]];
        [self addSubview:test];
*/
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
// TODO : Does not work on Darling
/*

    for (NSButton *button in [sender.superview subviews]) {
        if ([button isKindOfClass:[NSButton class]] &&
            [button.identifier isEqualToString:sender.identifier]) {
            [button setState:NSControlStateValueOff];
        }
    }
    [sender setState:NSControlStateValueOn];
*/
}

@end
