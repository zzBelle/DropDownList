//
//  ListCell.h
//  DropDownList
//
//  Created by 十月 on 2017/8/17.
//  Copyright © 2017年 October. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetialModel;

@interface ListCell : UITableViewCell

- (void)updateCellWithModel:(DetialModel *)model;

@end
