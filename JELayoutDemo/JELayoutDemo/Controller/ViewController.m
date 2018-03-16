//
//  ViewController.m
//  JELayoutDemo
//
//  Created by Milk on 2018/3/15.
//  Copyright © 2018年 milk. All rights reserved.
//

#import "ViewController.h"
#import "DecideHardwareTypeTool.h"
#import "DataSourceManager.h"
#import "JETypeButton.h"
#import "JEAbstractView.h"

@interface ViewController ()

@property (nonatomic, strong) JETypeButton *typeBtn;
@property (nonatomic, copy) NSArray *dataSources;
@property (nonatomic, assign) CGFloat top;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadDataSource];
    [self setupUI];
}

- (void)setupUI {
    
    // 不通过屏幕尺寸, 目前无法识别 iPhoneX 模拟器, 因为模拟器的设备类型是一样的.
    BOOL isIphoneX = CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(1125, 2436));
    self.top = [[DecideHardwareTypeTool receiveHardwareType] isEqual:JE_IPHONE_X] || isIphoneX ? 44 : 20;
    UIView *menuView = [[UIView alloc] initWithFrame:CGRectMake(0, self.top, kScreenW, 45)];
    menuView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:menuView];
    
    self.typeBtn = [JETypeButton initWithFrame:CGRectMake(kScreenW - 55, 5, 35, 35) superView:menuView target:self];
}

- (void)loadDataSource {
    
    [DataSourceManager loadData:^(NSArray *dataArray) {
        
        self.dataSources = dataArray;
        __weak typeof(self) weakSelf = self;
        self.typeBtn.setupUI = ^(ViewType type) {
            JEAbstractView *v = [JEAbstractView receiveTypeView:type frame:CGRectMake(0, self.top + 45, kScreenW, kScreenH - (self.top + 45)) dataSource:dataArray];
            [v setupWithsuperView:weakSelf.view];
        };
        self.typeBtn.setupUI(ViewTypeA);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
