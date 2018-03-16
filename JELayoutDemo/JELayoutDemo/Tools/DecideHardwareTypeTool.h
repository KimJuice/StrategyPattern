//
//  DecideHardwareTypeTool.h
//  JELayoutDemo
//
//  Created by Milk on 2018/3/15.
//  Copyright © 2018年 milk. All rights reserved.
//

#import <Foundation/Foundation.h>

#define JE_IPHONE_NONE      @(IPHONE_NONE)
#define JE_IPHONE_SIMULATOR @(IPHONE_SIMULATOR)
#define JE_IPHONE_X         @(IPHONE_X)
#define JE_IPHONE_8         @(IPHONE_8)
#define JE_IPHONE_6_P       @(IPHONE_6_P)

typedef enum : NSUInteger {
    IPHONE_NONE,
    IPHONE_SIMULATOR,
    IPHONE_X,
    IPHONE_8,
    IPHONE_6_P,
} JEHardwareType;

@interface DecideHardwareTypeTool : NSObject

+ (NSNumber *)receiveHardwareType;

@end
