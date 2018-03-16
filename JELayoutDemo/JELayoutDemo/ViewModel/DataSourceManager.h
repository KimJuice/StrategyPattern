//
//  DataSourceManager.h
//  JELayoutDemo
//
//  Created by Milk on 2018/3/15.
//  Copyright © 2018年 milk. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef void(^ResultBlock)(NSArray *dataArray);

@interface DataSourceManager : NSObject

+ (void)loadData:(void (^) (NSArray *dataArray))block;

@end
