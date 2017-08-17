//
//  ViewController.m
//  DropDownList
//
//  Created by 十月 on 2017/8/17.
//  Copyright © 2017年 October. All rights reserved.
//

#import "ViewController.h"
#import "FoolPopView.h"
#import "THModel.h"
#import "DetialModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    UIButton *button1 = [UIButton new];
    button1.frame = CGRectMake(20, 64, 200, 30);
    button1.backgroundColor = [UIColor whiteColor];
    button1.layer.borderWidth = 0.5;
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
    DetialModel *dm1 = self.thm.epMedTimeList.firstObject;
    [button1 setTitle:dm1.optionText forState:UIControlStateNormal];
    button1.tag = 1000;
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton new];
    button2.frame = CGRectMake(20, 164, 200, 30);
    button2.backgroundColor = [UIColor whiteColor];
    button2.layer.borderWidth = 0.5;
    [button2 addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    DetialModel *dm2 = self.thm.epMedDoseUnitList.firstObject;
    [button2 setTitle:dm2.optionText forState:UIControlStateNormal];
    button2.tag = 1001;
    [self.view addSubview:button2];

}
- (void)loadData {
    self.thm = [THModel new];
    DetialModel *dm0 = [DetialModel new];
    dm0.optionId = @"110";
    dm0.optionText = @"饭前";
    
    DetialModel *dm1 = [DetialModel new];
    dm1.optionId = @"111";
    dm1.optionText = @"饭中";

    DetialModel *dm2 = [DetialModel new];
    dm2.optionId = @"112";
    dm2.optionText = @"饭后";
    NSArray *a = @[dm0, dm1, dm2];

    self.thm.epMedTimeList = a;
    
    DetialModel *dm3 = [DetialModel new];
    dm3.optionId = @"120";
    dm3.optionText = @"mg/次";
    
    DetialModel *dm4 = [DetialModel new];
    dm4.optionId = @"121";
    dm4.optionText = @"g/次";
    
    DetialModel *dm5 = [DetialModel new];
    dm5.optionId = @"122";
    dm5.optionText = @"ml/次";
    NSArray *b = @[dm3, dm4, dm5];
    
    self.thm.epMedDoseUnitList = b;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button click
- (void)onClickButton:(UIButton *)button {
    switch (button.tag) {
        case 1000: {
            [FoolPopView showInView:button dataSource:self.thm.epMedTimeList didSelected:^(FoolPopView *view, DetialModel *dm) {
                NSLog(@"%@",dm.optionText);
            }];
        }
            break;
        case 1001: {
            [FoolPopView showInView:button dataSource:self.thm.epMedDoseUnitList didSelected:^(FoolPopView *view, DetialModel *dm) {
                NSLog(@"%@",dm.optionText);
            }];
        }
            break;
            
        default:
            break;
    }
}
@end
