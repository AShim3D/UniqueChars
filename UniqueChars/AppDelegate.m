//
//  AppDelegate.m
//  UniqueChars
//
//  Created by Misha on 9/30/14.
//  Copyright (c) 2014 AppMania. All rights reserved.
//

#define UNICHAR_MAX (1ull << (CHAR_BIT * sizeof(unichar)))

#import "AppDelegate.h"

@interface AppDelegate ()

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextView *inputText;
@property (assign) IBOutlet NSButton *findButton;
@property (assign) IBOutlet NSTextView *outputText;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)find: (id) sender {
    NSString *inputString = self.inputText.string;
    NSMutableArray *allChars = [NSMutableArray array];
    NSRange theRange = {0, 1};
    for (NSInteger i = 0; i < [inputString length]; i++) {
        theRange.location = i;
        NSString *character = [inputString substringWithRange:theRange];
        if (![allChars containsObject:character]) {
            [allChars addObject:character];
        }
    }
    allChars = [allChars sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        return [a compare:b];
    }];
    [self.outputText setString:[allChars componentsJoinedByString:@""]];
}

@end
