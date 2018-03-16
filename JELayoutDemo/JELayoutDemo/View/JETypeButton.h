//
//  JETypeButton.h
//  JELayoutDemo
//
//  Created by Milk on 2018/3/16.
//  Copyright © 2018年 milk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ViewTypeA,
    ViewTypeB,
} ViewType;

typedef void(^SetupUIBlock)(ViewType type);

@interface JETypeButton : UIButton

@property (nonatomic, copy) SetupUIBlock setupUI;

+ (instancetype)initWithFrame:(CGRect)frame superView:(UIView *)superView target:(UIResponder *)target;

@end
