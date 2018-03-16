//
//  JEAbstractView.m
//  JELayoutDemo
//
//  Created by Milk on 2018/3/16.
//  Copyright © 2018年 milk. All rights reserved.
//

#import "JEAbstractView.h"
#import "JETypeTableView.h"
#import "JETypeWaterfallsFlowView.h"

@implementation JEAbstractView

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray<Merchandise *> *)dataSource {
    
    if (self = [super init]) {
        self.frame = frame;
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

+ (instancetype)receiveTypeView:(ViewType)type frame:(CGRect)frame dataSource:(NSArray *)dataSources {
    
    JEAbstractView *v = [[JEAbstractView alloc] initWithFrame:frame dataSource:dataSources];
    switch (type) {
        case ViewTypeA:
            v = [[JETypeTableView alloc] initWithFrame:frame dataSource:dataSources];
            break;
        case ViewTypeB:
            v = [[JETypeWaterfallsFlowView alloc] initWithFrame:frame dataSource:dataSources];
            break;
    }
    v.dataSource = dataSources;

    return v;
}

- (void)setupWithsuperView:(UIView *)superView {
    
    // 此 demo 暂不考虑界面切换时的数据定位问题
    for (UIView *v in superView.subviews) {
        if ([v isKindOfClass:[JEAbstractView class]]) {
            [v removeFromSuperview];
        }
    }
    [superView addSubview:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
