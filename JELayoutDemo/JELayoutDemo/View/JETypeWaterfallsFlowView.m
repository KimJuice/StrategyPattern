//
//  JETypeWaterfallsFlowView.m
//  JELayoutDemo
//
//  Created by Milk on 2018/3/16.
//  Copyright © 2018年 milk. All rights reserved.
//

#import "JETypeWaterfallsFlowView.h"
#import "Merchandise.h"

#define kIdentifier [NSString stringWithFormat:@"%@Cell", NSStringFromClass([self class])]
#define kItemWidth  (kScreenW - 10) * 0.5

@interface JETypeWaterfallsFlowView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation JETypeWaterfallsFlowView

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray<Merchandise *> *)dataSource {
    
    if (self = [super init]) {
        self.frame = frame;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(kItemWidth, kItemWidth * 1.3);
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.showsVerticalScrollIndicator = NO;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.collectionView];
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kIdentifier];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 正常应该新自定义个 cell 这里省略...
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UICollectionViewCell alloc] init];
    }
    
    Merchandise *model = self.dataSource[indexPath.item];
    
    NSInteger i = 0;
    for (UIView *v in cell.contentView.subviews) {
        i = v.tag;

        if ([v isKindOfClass:[UIImageView class]] && v.tag == 10001) {
            ((UIImageView *)v).image = model.icon;
        }
        if ([v isKindOfClass:[UILabel class]] && v.tag == 10002) {
            ((UILabel *)v).text = model.name;
        }
        if ([v isKindOfClass:[UIButton class]] && v.tag == 10003) {
        }
    }
    
    if (i == 0) {
        
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, kItemWidth - 20, kItemWidth - 20)];
        imgV.image = model.icon;
        imgV.tag = 10001;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, kItemWidth + 10, kItemWidth - 50, 30)];
        label.font = [UIFont systemFontOfSize:15];
        label.text = model.name;
        label.tag = 10002;
        
        UIButton *buy = [[UIButton alloc] initWithFrame:CGRectMake(kItemWidth - 40, kItemWidth + 10, 40, 40)];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cart" ofType:@"png"];
        [buy setBackgroundImage:[UIImage imageWithContentsOfFile:path] forState:UIControlStateNormal];
        buy.tag = 10003;
        
        [cell.contentView addSubview:label];
        [cell.contentView addSubview:imgV];
        [cell.contentView addSubview:buy];
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
