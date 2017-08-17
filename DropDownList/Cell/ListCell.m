//
//  ListCell.m
//  DropDownList
//
//  Created by 十月 on 2017/8/17.
//  Copyright © 2017年 October. All rights reserved.
//

#import "ListCell.h"
#import "DetialModel.h"

@interface ListCell ()

@property (nonatomic) UILabel *titleLab;

@end

@implementation ListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
        [self setUpView];
    }
    return self;
}

- (void)setUpView {
    self.titleLab = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        [self.contentView addSubview:label];
        label;
    });
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLab.frame = self.contentView.bounds;
}

- (void)updateCellWithModel:(DetialModel *)model {
    self.titleLab.text = model.optionText;
}
@end
