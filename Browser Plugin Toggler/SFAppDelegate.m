//
//  SFAppDelegate.m
//  Browser Plugin Toggler
//
//  Created by Simon Fransson on 2013-11-22.
//  Copyright (c) 2013 Simon Fransson. All rights reserved.
//

#import "SFAppDelegate.h"
#import "SFPluginToggler.h"
#import "SFMenuController.h"

@interface SFAppDelegate(Private)

- (void)setup;
- (void)loadPlugins;

- (void)setupStatusItem;

@end


@implementation SFAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self setup];
    [self setupMenu];
    [self setupStatusItem];
}

- (void)setupStatusItem
{
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    [self.statusItem setImage:[NSImage imageNamed:@"StatusBarIcon"]];
    [self.statusItem setHighlightMode:YES];
    [self.statusItem setEnabled:YES];
    [self.statusItem setToolTip:@"Browser Plugin Toggler"];
    
    [self.statusItem setAction:@selector(statusItemClicked:)];
    [self.statusItem setTarget:self];
    
    [self.statusItem setMenu:self.menuController.menu];
}

- (IBAction)statusItemClicked:(id)sender
{
    NSLog(@"Menu clicked!");
}

- (void)setupMenu
{
    self.menuController = [[SFMenuController alloc] initWithToggler:self.toggler];
}

- (void)setup
{
    NSURL *pluginsURL = [NSURL fileURLWithPath:BPT_PLUGINS_DIRECTORY_PATH];
    NSURL *disabledPluginsURL = [NSURL fileURLWithPath:BPT_DISABLED_DIRECTORY_PATH];
    
    self.toggler = [[SFPluginToggler alloc] initWithPluginsURL:pluginsURL disabledPluginsURL:disabledPluginsURL];
    
    [self loadPlugins];
}

- (void)loadPlugins
{
    [self.toggler loadPlugins];
}

@end
