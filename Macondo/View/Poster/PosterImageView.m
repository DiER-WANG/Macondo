//
//  PosterImageView.m
//  Macondo
//
//  Created by wangchangyang on 16/7/15.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "PosterImageView.h"


@interface PosterImageView()





@end


@implementation PosterImageView

- (void)setBorderColor:(UIColor *)borderColor {
    
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    
    if (borderWidth < 0) {
        
        return;
    }
    
    _borderWidth = borderWidth;
    
    self.layer.borderWidth = borderWidth;
}

- (void)setcornerRadius:(CGFloat)cornerRadius {
    
    if (cornerRadius < 0) {
        
        return;
    }
    
    self.layer.cornerRadius = cornerRadius;
}
@end
