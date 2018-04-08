//
//  PersonalCustomNavigationBarView.m
//  WeiboPersonalPageDemo
//
//  Created by JasonYan on 2018/4/8.
//  Copyright © 2018年 JasonYan. All rights reserved.
//

#import "PersonalCustomNavigationBarView.h"

@interface PersonalCustomNavigationBarView ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *redSpot;
@property (weak, nonatomic) IBOutlet UIButton *mesageCenterBtn;
@property (weak, nonatomic) IBOutlet UIButton *settingBtn;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *refreshIndicator;


@property (weak, nonatomic) IBOutlet UIView *bottomLineView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineHeightConstraint;
@end

@implementation PersonalCustomNavigationBarView

- (instancetype)init {
    self = [super init];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
    self= [[nib instantiateWithOwner:nil options:nil] firstObject];
    if (self) {
        self.frame = frame;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bottomLineHeightConstraint.constant = onePX;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
    self.titleLabel.textColor = UIColorFromRGB(0x333333);
}


#pragma mark -
#pragma mark helper/private methods

- (IBAction)messageCenterBtnClick:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(personalCustomNavigationBarMessageCenterClick)]) {
        [_delegate personalCustomNavigationBarMessageCenterClick];
    }
}

- (IBAction)settingsBtnClick:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(personalCustomNavigationBarSettingsClick)]) {
        [_delegate personalCustomNavigationBarSettingsClick];
    }
}


#pragma mark -
#pragma mark public methods


- (void)startAnimating {
    [self.refreshIndicator startAnimating];
    [self.refreshIndicator setHidden:NO];
    [self.settingBtn setHidden:YES];
}

- (void)stopAnimating {
    [self.refreshIndicator stopAnimating];
    [self.refreshIndicator setHidden:YES];
    [self.settingBtn setHidden:NO];
}

- (BOOL)isAnimating {
    return self.refreshIndicator.isAnimating;
}


#pragma mark -
#pragma mark Update View

- (void)setElementsAlpha:(CGFloat)alpha {
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:alpha];
    self.titleLabel.alpha = alpha;
    self.bottomLineView.alpha = alpha;
    if (alpha >= 0.4) {
        [self.mesageCenterBtn setImage:[UIImage imageNamed:@"messageCenter_blue"] forState:UIControlStateNormal];
        [self.settingBtn setImage:[UIImage imageNamed:@"setting_blue"] forState:UIControlStateNormal];
        self.titleLabel.hidden = NO;
        [self.titleLabel sizeToFit];
    }
    else {
        [self.mesageCenterBtn setImage:[UIImage imageNamed:@"messageCenter"] forState:UIControlStateNormal];
        [self.settingBtn setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
        self.titleLabel.hidden = YES;
    }
}


#pragma mark -
#pragma mark Getter/Setter

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
    [self.titleLabel sizeToFit];
}
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:backgroundColor];
}

- (void)setRedSpotHidden:(BOOL)redSpotHidden {
    self.redSpot.hidden = redSpotHidden;
}
@end

