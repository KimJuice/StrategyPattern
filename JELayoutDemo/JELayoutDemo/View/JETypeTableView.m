//
//  JETypeTableView.m
//  JELayoutDemo
//
//  Created by Milk on 2018/3/16.
//  Copyright © 2018年 milk. All rights reserved.
//

#import "JETypeTableView.h"

#define kIdentifier   [NSString stringWithFormat:@"%@Cell", NSStringFromClass([self class])]

@interface JETypeTableView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation JETypeTableView

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray<Merchandise *> *)dataSource {
    
    if (self = [super init]) {
        self.frame = frame;
        self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        [self addSubview:self.tableView];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.showsHorizontalScrollIndicator = NO;
        self.tableView.showsVerticalScrollIndicator = NO;
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kIdentifier];
    }
    
    Merchandise *model = self.dataSource[indexPath.row];
    cell.imageView.image = model.icon;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.textLabel.text = model.name;
    UIButton *buy = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cart" ofType:@"png"];
    [buy setBackgroundImage:[UIImage imageWithContentsOfFile:path] forState:UIControlStateNormal];
    cell.accessoryView = buy;
    
    return cell;
}

@end
