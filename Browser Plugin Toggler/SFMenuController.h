//
//  SFMenuController.h
//  Browser Plugin Toggler
//
//  Created by Simon Fransson on 2013-11-22.
//  Copyright (c) 2013 Simon Fransson. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SFPluginToggler;

@interface SFMenuController : NSObject

@property (retain) SFPluginToggler *toggler;
@property (retain) NSMenu *menu;

- (id)initWithToggler:(SFPluginToggler *)toggler;

@end
