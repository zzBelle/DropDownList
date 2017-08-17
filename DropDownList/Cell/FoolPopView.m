//
//  FoolPopView.m
//  DropDownList
//
//  Created by 十月 on 2017/8/17.
//  Copyright © 2017年 October. All rights reserved.
//

#import "FoolPopView.h"
#import "DetialModel.h"
#import "ListCell.h"

#define kCellHeight (30.0)

@interface FoolPopView ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, copy) NSArray *dataSource;
@property (nonatomic, copy) DidSelectedBlock didSelectedBlock;
@property (nonatomic, weak) UIButton *curBtn;
@property (nonatomic) UITableView *tableView;

@end

@implementation FoolPopView
static NSString * const identifier = @"com.downList.cell";

- (instancetype)initWithView:(UIButton *)button dataSource:(NSArray *)dataSource {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(CGRectGetMinX(button.frame), CGRectGetMaxY(button.frame) - (dataSource.count *kCellHeight) / 2.0, CGRectGetWidth(button.frame), dataSource.count *kCellHeight);
        self.layer.anchorPoint = CGPointMake(0.5, 0.0);
        self.backgroundColor = [UIColor whiteColor];
        self.curBtn = button;
        self.dataSource = dataSource;
        [self setUpViews];
        self.transform = CGAffineTransformMakeScale(1.0, 0.0000001);
    }
    return self;
}

- (void)setUpViews {
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        [self addSubview:tableView];
        tableView.separatorStyle = UITableViewCellEditingStyleNone;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = kCellHeight;
        [tableView registerClass:[ListCell class] forCellReuseIdentifier:identifier];
        tableView;
    });
}

- (void)show {
    [UIView animateWithDuration:0.2 animations:^{
        self.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:0.2 animations:^{
        self.transform = CGAffineTransformMakeScale(1.0, 0.0000001);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];

}

#pragma mark degelate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    DetialModel *dm = self.dataSource[indexPath.row];
    [cell updateCellWithModel:dm];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetialModel *dm = self.dataSource[indexPath.row];
    [self.curBtn setTitle:dm.optionText forState:UIControlStateNormal];
    if (self.didSelectedBlock) {
        self.didSelectedBlock(self, dm);
    }
    [self dismiss];
}

//展开
+ (instancetype)showInView:(UIButton *)button dataSource:(NSArray *)dataSource didSelected:(DidSelectedBlock)didSelectedBlock {
    [self dismissAllWithButton:button];
    FoolPopView *fpv = [[self alloc] initWithView:button dataSource:dataSource];
    fpv.didSelectedBlock = didSelectedBlock;
    [button.superview addSubview:fpv];
    [fpv show];
    return fpv;
}

//收起
+ (void)dismissAllWithButton:(UIButton *)button {
    for (UIView *subView in button.superview.subviews) {
        if ([subView isKindOfClass:[self class]]) {
            FoolPopView *fpv = (FoolPopView *)subView;
            [fpv dismiss];
        }
    }
}
@end
