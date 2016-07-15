//
//  PosterImageView.h
//  Macondo
//
//  Created by wangchangyang on 16/7/15.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE // 动态刷新 xib

@interface PosterImageView : UIImageView

/** 可视化设置圆角 */
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

/** 可视化设置边框宽度 */
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

/** 可视化设置边框颜色 */
@property (nonatomic, assign) IBInspectable UIColor *borderColor;

@end
