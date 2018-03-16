//
//  JETypeButton.m
//  JELayoutDemo
//
//  Created by Milk on 2018/3/16.
//  Copyright © 2018年 milk. All rights reserved.
//

#import "JETypeButton.h"

@interface JETypeButton ()

@property (nonatomic, assign) ViewType viewType;

@end

@implementation JETypeButton

+ (instancetype)initWithFrame:(CGRect)frame superView:(UIView *)superView target:(UIResponder *)target {
    
    JETypeButton *typeBtn  = [[JETypeButton alloc] initWithFrame:frame];
    [typeBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"type_2" ofType:@"png"]] forState:UIControlStateNormal];
    [typeBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"type_1" ofType:@"png"]] forState:UIControlStateSelected];
    typeBtn.viewType = typeBtn.isSelected ? ViewTypeB : ViewTypeA;
    [typeBtn addTarget:typeBtn action:@selector(setupViewType:) forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:typeBtn];

    return typeBtn;
}

- (void)setupViewType:(JETypeButton *)sender {
    
    sender.selected = !sender.isSelected;
    sender.viewType = sender.isSelected ? ViewTypeB : ViewTypeA;
    if (sender.setupUI) {        
        sender.setupUI(sender.viewType);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
