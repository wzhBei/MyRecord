//
//  UIView+Additions.m
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/18.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)

-(void)addAppBorders
{
    self.layer.cornerRadius = 3.0f;
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

@end
