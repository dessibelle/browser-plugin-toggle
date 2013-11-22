//
//  SFAppDelegate.h
//  Browser Plugin Toggler
//
//  Created by Simon Fransson on 2013-11-22.
//  Copyright (c) 2013 Simon Fransson. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class SFPluginToggler, SFMenuController;

@interface SFAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (retain) NSStatusItem *statusItem;

@property (retain) SFMenuController *menuController;
@property (retain) SFPluginToggler *toggler;

@end
