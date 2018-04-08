//
//  PersonalCustomNavigationBarView.h
//  WeiboPersonalPageDemo
//
//  Created by JasonYan on 2018/4/8.
//  Copyright © 2018年 JasonYan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PersonalCustomNavigationBarViewDelegate <NSObject>

- (void)personalCustomNavigationBarMessageCenterClick;
- (void)personalCustomNavigationBarSettingsClick;

@end

@interface PersonalCustomNavigationBarView : UIView
@property (copy, nonatomic) NSString *title;
@property (assign, nonatomic) BOOL redSpotHidden;
@property (weak, nonatomic) id<PersonalCustomNavigationBarViewDelegate> delegate;
- (void)setElementsAlpha:(CGFloat)alpha;

- (void)startAnimating;

- (void)stopAnimating;

- (BOOL)isAnimating;
@end
