//
//  PersonalHeaderView.h
//  WeiboPersonalPageDemo
//
//  Created by JasonYan on 2018/4/8.
//  Copyright © 2018年 JasonYan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PersonalHeaderVectorViewStyle) {
    PersonalHeaderVectorViewStyleDefault = 0, //!< 默认Style
    PersonalHeaderVectorViewStyleWhite,       //!< 白色Style
};


typedef NS_ENUM(NSInteger, PersonalHeaderVectorType) {
    PersonalHeaderVectorTypeHome = 0,       //!< 收藏
    PersonalHeaderVectorTypeWeiBo,          //!<  Weibo
    PersonalHeaderVectorTypeAlbum,          //!<  相册
};

@protocol PersonalHeaderViewDelegate;
@class DestAccount;
@interface PersonalHeaderView : UICollectionReusableView

@property (weak, nonatomic) id<PersonalHeaderViewDelegate> delegate;
@property (assign, nonatomic) PersonalHeaderVectorViewStyle vectorViewStyle;

- (PersonalHeaderVectorType)selectVectorType;
- (void)setSelectVectorType:(PersonalHeaderVectorType)vectorType;

+ (instancetype)loadForNib;

@end




@protocol PersonalHeaderViewDelegate <NSObject>

- (void)personalHeaderVectorWillClick:(PersonalHeaderVectorType)oldvectotType;
- (void)personalHeaderVectorDidClick:(PersonalHeaderVectorType)vectotType;
- (void)personalHeaderUserAvatarClick;
@end
