//
//  SFPluginToggler.h
//  Browser Plugin Toggler
//
//  Created by Simon Fransson on 2013-11-22.
//  Copyright (c) 2013 Simon Fransson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFPluginToggler : NSObject

@property (retain) NSURL *pluginsURL;
@property (retain) NSURL *disabledPluginsURL;
@property (retain) NSArray *plugins;


- (id)initWithPluginsPath:(NSString *)pluginsPath disabledPath:(NSString *)disabledPluginsPath;
- (id)initWithPluginsURL:(NSURL *)pluginsURL disabledPluginsURL:(NSURL *)disabledPluginsURL;

- (void)loadPlugins;
- (void)togglePluginAtIndex:(NSUInteger)index;

@end
