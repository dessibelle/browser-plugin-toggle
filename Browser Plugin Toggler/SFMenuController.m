//
//  SFMenuController.m
//  Browser Plugin Toggler
//
//  Created by Simon Fransson on 2013-11-22.
//  Copyright (c) 2013 Simon Fransson. All rights reserved.
//

#import "SFMenuController.h"
#import "SFPluginToggler.h"
#

@implementation SFMenuController

- (id)initWithToggler:(SFPluginToggler *)toggler
{
    self = [super init];
    if (self)
    {
        self.toggler = toggler;
        self.menu = [[NSMenu alloc] initWithTitle:@"Browser Plugin Toggler"];
        
        [self refreshMenu];
    }
    return self;
}

- (void)refreshMenu
{
    for (NSUInteger i = 0; i < self.toggler.plugins.count; i++)
    {
        NSObject *obj = [self.toggler.plugins objectAtIndex:i];
        
        NSMenuItem *menuItem = [[NSMenuItem alloc] initWithTitle:[obj description] action:@selector(menuItemClicked:) keyEquivalent:@""];
        
        [menuItem setTarget:self];
        [menuItem setTag:i];
        
        [self.menu addItem:menuItem];
    }
}

- (IBAction)menuItemClicked:(id)sender
{
    NSUInteger idx = [sender tag];
    
    NSLog(@"Menu item clicked: %@", [[self.toggler.plugins objectAtIndex:idx] description]);
    
    [self.toggler togglePluginAtIndex:idx];
}

@end
