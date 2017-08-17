//
//  FoolPopView.h
//  DropDownList
//
//  Created by 十月 on 2017/8/17.
//  Copyright © 2017年 October. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetialModel;
@class FoolPopView;

typedef void(^DidSelectedBlock)(FoolPopView *view, DetialModel *dm);

@interface FoolPopView : UIView

+ (instancetype)showInView:(UIButton *)button dataSource:(NSArray *)dataSource didSelected:(DidSelectedBlock)didSelectedBlock;

@end
