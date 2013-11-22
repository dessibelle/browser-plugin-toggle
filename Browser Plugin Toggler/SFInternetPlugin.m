//
//  SFInternetPlugin.m
//  Browser Plugin Toggler
//
//  Created by Simon Fransson on 2013-11-22.
//  Copyright (c) 2013 Simon Fransson. All rights reserved.
//

#import "SFInternetPlugin.h"

@interface SFInternetPlugin (Private)

- (NSURL *)toggledURL;

@end

@implementation SFInternetPlugin

@dynamic disabled;

- (id)initWithName:(NSString *)name url:(NSURL *)url
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.pluginURL = url;
    }
    return self;
}

- (BOOL)disabled
{
    NSURL *disabledPath = [NSURL fileURLWithPath:BPT_DISABLED_DIRECTORY_PATH];
    
    return [[self.pluginURL path] hasPrefix:[disabledPath path]];
}

- (NSString *)description
{
    NSString *description = self.name;
    
    if (self.disabled)
    {
        description = [description stringByAppendingString:NSLocalizedString(@" (Disabled)", @"Disabled plugin name addition")];
    }
    
    return description;
}

- (NSURL *)toggledURL
{
    NSString *path = [self.pluginURL path];
    
    NSString *pluginsPath = [[NSURL fileURLWithPath:BPT_PLUGINS_DIRECTORY_PATH] path];
    NSString *disabledPath = [[NSURL fileURLWithPath:BPT_DISABLED_DIRECTORY_PATH] path];
    
    NSString *toggledPath = [path stringByReplacingOccurrencesOfString:(self.disabled ? disabledPath : pluginsPath) withString:(self.disabled ? pluginsPath : disabledPath)];
    
    return [NSURL fileURLWithPath:toggledPath];
}

- (void)toggle
{
    NSLog(@"Toggling plugin %@", self.name);

    NSError *error;
    NSURL *resultingURL;
    
    NSLog(@"Moving %@ from \n    %@ to \n    %@", self.name, self.pluginURL, self.toggledURL);
    
    [[NSFileManager defaultManager] replaceItemAtURL:self.toggledURL withItemAtURL:self.pluginURL backupItemName:@"BPT_backup" options:NSFileManagerItemReplacementUsingNewMetadataOnly resultingItemURL:&resultingURL error:&error];
    
    if (error)
    {
        NSLog(@"An error occured when toggling the plugin %@: %@", self.name, error);
    }
    
    if (!error && resultingURL)
    {
        self.pluginURL = resultingURL;
    }
}

@end
