//
//  SFInternetPlugin.h
//  Browser Plugin Toggler
//
//  Created by Simon Fransson on 2013-11-22.
//  Copyright (c) 2013 Simon Fransson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFInternetPlugin : NSObject

@property (retain) NSString *name;
@property (retain) NSURL *pluginURL;
@property (readonly) BOOL disabled;

- (id)initWithName:(NSString *)name url:(NSURL *)url;
- (void)toggle;


@end
