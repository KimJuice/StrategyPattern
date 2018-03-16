//
//  DecideHardwareTypeTool.m
//  JELayoutDemo
//
//  Created by Milk on 2018/3/15.
//  Copyright © 2018年 milk. All rights reserved.
//

#import "DecideHardwareTypeTool.h"
#import <sys/utsname.h>

@implementation DecideHardwareTypeTool

+ (NSNumber *)receiveHardwareType {
    
    NSNumber *type = JE_IPHONE_NONE;
    struct utsname hardwareType;
    uname(&hardwareType);
    NSString *typeName = [NSString stringWithCString:hardwareType.machine encoding:NSASCIIStringEncoding];
    if ([typeName isEqualToString:@"x86_64"] || [typeName isEqualToString:@"i386"]) type = JE_IPHONE_SIMULATOR;
    if ([typeName isEqualToString:@"iPhone10,3"] || [typeName isEqualToString:@"iPhone10,6"]) type = JE_IPHONE_X;
    if ([typeName isEqualToString:@"iPhone10,1"] || [typeName isEqualToString:@"iPhone10,4"]) type = JE_IPHONE_8;
    if ([typeName isEqualToString:@"iPhone7,1"]) type = JE_IPHONE_8;
    
    return type;
}

@end
