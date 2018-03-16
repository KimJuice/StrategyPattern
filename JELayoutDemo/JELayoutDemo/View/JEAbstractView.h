//
//  JEAbstractView.h
//  JELayoutDemo
//
//  Created by Milk on 2018/3/16.
//  Copyright © 2018年 milk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Merchandise.h"
#import "JETypeButton.h"

@interface JEAbstractView : UIView

@property (nonatomic, copy) NSArray *dataSource;

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray<Merchandise *> *)dataSource;

+ (instancetype)receiveTypeView:(ViewType)type frame:(CGRect)frame dataSource:(NSArray *)dataSources;

- (void)setupWithsuperView:(UIView *)superView;

@end
