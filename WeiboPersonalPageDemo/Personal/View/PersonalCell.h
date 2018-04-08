//
//  PersonalCell.h
//  WeiboPersonalPageDemo
//
//  Created by JasonYan on 2018/4/8.
//  Copyright © 2018年 JasonYan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgV;


#pragma mark -
#pragma mark Class Method
+ (UINib *)nib;
/// 单元格重用标识符
+ (NSString *)reuseIdentifier;

+ (CGSize)size;
@end
