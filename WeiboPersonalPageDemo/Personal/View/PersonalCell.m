//
//  PersonalCell.m
//  WeiboPersonalPageDemo
//
//  Created by JasonYan on 2018/4/8.
//  Copyright © 2018年 JasonYan. All rights reserved.
//

#import "PersonalCell.h"

@implementation PersonalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark -
#pragma mark Class Method

+ (UINib *)nib {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
    return nib;
}

static NSString *const reuseIdentifier = @"PersonalCell";
/// 单元格重用标识符
+ (NSString *)reuseIdentifier {
    return reuseIdentifier;
}

+ (CGSize)size {
    CGFloat width = (ScreenWidth - 12 * 3) / 2.0;
    CGFloat height = width + 30.0;
    return CGSizeMake(width, height);
}

@end
