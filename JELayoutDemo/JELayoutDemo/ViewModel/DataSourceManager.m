//
//  DataSourceManager.m
//  JELayoutDemo
//
//  Created by Milk on 2018/3/15.
//  Copyright © 2018年 milk. All rights reserved.
//

#import "DataSourceManager.h"
#import "Merchandise.h"

@implementation DataSourceManager

+ (void)loadData:(void (^)(NSArray *))block {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [NSThread sleepForTimeInterval:0.5];
        NSMutableArray *sources = [NSMutableArray array];
        for (int i = 0; i < 60; i++) {
            
            Merchandise *m = [[Merchandise alloc] init];
            m.name = [NSString stringWithFormat:@"Merchandise__%d", i];
            int temp = i % 6;
            NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"merchandise_%d", temp] ofType:@"jpg"];
            m.icon = [UIImage imageWithContentsOfFile:path];
            
            [sources addObject:m];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            block(sources);
        });
    });
}

@end
