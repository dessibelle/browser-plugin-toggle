//
//  SFPluginToggler.m
//  Browser Plugin Toggler
//
//  Created by Simon Fransson on 2013-11-22.
//  Copyright (c) 2013 Simon Fransson. All rights reserved.
//

#import "SFPluginToggler.h"
#import "SFInternetPlugin.h"

@interface SFPluginToggler (Private)

- (void)loadPluginsAtURL:(NSURL *)url;

@end

@implementation SFPluginToggler

- (id)init{
    self = [super init];
    if (self)
    {
        self.plugins = @[];
    }
    return self;
}

- (id)initWithPluginsPath:(NSString *)pluginsPath disabledPath:(NSString *)disabledPluginsPath
{
    self = [self initWithPluginsURL:[NSURL fileURLWithPath:pluginsPath] disabledPluginsURL:[NSURL fileURLWithPath:disabledPluginsPath]];
    
    return self;
}

- (id)initWithPluginsURL:(NSURL *)pluginsURL disabledPluginsURL:(NSURL *)disabledPluginsURL
{
    self = [self init];
    if (self)
    {
        self.pluginsURL = pluginsURL;
        self.disabledPluginsURL = disabledPluginsURL;
    }
    return self;
}

- (NSString *)description
{
    NSString *description = [self.plugins componentsJoinedByString:@", "];
    
    return description;
}


- (void)loadPlugins
{
    [self loadPluginsAtURL:self.pluginsURL];
    [self loadPluginsAtURL:self.disabledPluginsURL];
}

- (void)loadPluginsAtURL:(NSURL *)url
{
    NSError *error;
    NSArray *pluginURLs = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:url includingPropertiesForKeys:@[] options:NSDirectoryEnumerationSkipsHiddenFiles error:&error];
    
    if (error)
    {
        NSLog(@"An error occured when loading Internet Plug-Ins: %@", error);
    }
    
    NSMutableArray *plugins = [NSMutableArray array];
    for (NSURL *url in pluginURLs)
    {
        if (![url isEqual:self.pluginsURL] && ![url isEqual:self.disabledPluginsURL])
        {
            NSString *name = [url lastPathComponent];
            
            SFInternetPlugin *plugin = [[SFInternetPlugin alloc] initWithName:name url:url];
            
            if (plugin)
            {
                [plugins addObject:plugin];
            }
        }
    }
    
    if ([plugins count])
    {
        self.plugins = [self.plugins arrayByAddingObjectsFromArray:plugins];
    }
}

- (void)togglePluginAtIndex:(NSUInteger)index
{
    SFInternetPlugin *plugin = [self.plugins objectAtIndex:index];
    [plugin toggle];
}

@end
