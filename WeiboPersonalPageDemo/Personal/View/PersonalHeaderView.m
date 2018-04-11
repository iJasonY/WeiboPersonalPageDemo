//
//  PersonalHeaderView.m
//  WeiboPersonalPageDemo
//
//  Created by JasonYan on 2018/4/8.
//  Copyright © 2018年 JasonYan. All rights reserved.
//

#import "PersonalHeaderView.h"
#import "UIImageView+WebCache.h"

@interface PersonalHeaderView ()

@property (weak, nonatomic) IBOutlet UIImageView *userAvatar;
@property (weak, nonatomic) IBOutlet UILabel *userId;
@property (weak, nonatomic) IBOutlet UILabel *score;

@property (weak, nonatomic) IBOutlet UILabel *collectionNum;
@property (weak, nonatomic) IBOutlet UILabel *tripNum;
@property (weak, nonatomic) IBOutlet UILabel *commentNum;

@property (weak, nonatomic) IBOutlet UILabel *collection;
@property (weak, nonatomic) IBOutlet UILabel *trip;
@property (weak, nonatomic) IBOutlet UILabel *comment;

@property (weak, nonatomic) IBOutlet UIView *scoreView;
@property (weak, nonatomic) IBOutlet UIView *vectorView;

@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondBtn;
@property (weak, nonatomic) IBOutlet UIButton *thirdBtn;


@property (weak, nonatomic) IBOutlet UIView *firstLineView;
@property (weak, nonatomic) IBOutlet UIView *secondLineView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstLineWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondLineWidth;

@property (weak, nonatomic) IBOutlet UIView *bottomLineView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineHeight;


@property (assign, nonatomic) NSInteger lastSelectIndex;

@end

@implementation PersonalHeaderView

- (void)awakeFromNib
{
    [super awakeFromNib];
    _vectorViewStyle = PersonalHeaderVectorViewStyleDefault;
    // Initialization code
    self.firstLineWidth.constant = self.secondLineWidth.constant = onePX;
    self.bottomLineHeight.constant = onePX;
    self.userId.hidden = self.scoreView.hidden = YES;
    [self setUpUI];
}

- (void)setUpUI {
    self.scoreView.hidden = YES;
    self.userId.hidden = YES;
    self.userAvatar.image = [UIImage imageNamed:@"avatar"];
    self.score.text = @"0";
    self.tripNum.text = @"0";
    self.collectionNum.text = @"0";
    self.commentNum.text = @"0";
    self.vectorView.userInteractionEnabled = NO;
    [self resetTextColor:self.lastSelectIndex];
    _lastSelectIndex = -1;
}


#pragma mark -
#pragma mark event response

- (IBAction)personalVectorDidClick:(UIButton *)sender {
    //    NSLog(@"UiControl:%ld", (long)sender.tag); //0x00b7ff
    NSInteger selectIndex = sender.tag;
    [self setSelectVectorType:selectIndex];
}

- (IBAction)userAvatatClick:(UITapGestureRecognizer *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(personalHeaderUserAvatarClick)]) {
        [_delegate personalHeaderUserAvatarClick];
    }
}

#pragma mark -
#pragma mark helper/private methods

- (void)setVectorViewStyle:(PersonalHeaderVectorViewStyle)vectorViewStyle {
    _vectorViewStyle = vectorViewStyle;
    switch (vectorViewStyle) {
        case PersonalHeaderVectorViewStyleDefault: {
            self.vectorView.backgroundColor = UIColorFromRGBAlpha(0x000000, 0.4);
            UIColor *lineBGColor = UIColorFromRGBAlpha(0xffffff, 0.2);
            self.firstLineView.backgroundColor = lineBGColor;
            self.secondLineView.backgroundColor = lineBGColor;
            [self changeTextColorWithVectorViewStyle:vectorViewStyle];
            break;
        }
        case PersonalHeaderVectorViewStyleWhite: {
            self.vectorView.backgroundColor = [UIColor whiteColor];
            UIColor *lineBGColor = UIColorFromRGB(0xe9e9e9);
            self.firstLineView.backgroundColor = lineBGColor;
            self.secondLineView.backgroundColor = lineBGColor;
            [self changeTextColorWithVectorViewStyle:vectorViewStyle];
            break;
        }
    }
}

- (void)changeTextColorWithVectorViewStyle:(PersonalHeaderVectorViewStyle)vectorViewStyle {
    UIColor *defaultTextColor = [UIColor whiteColor];
    if (_vectorViewStyle == PersonalHeaderVectorViewStyleWhite) {
        defaultTextColor = UIColorFromRGB(0x666666);
    }

    self.collectionNum.textColor = self.collection.textColor = defaultTextColor;
    self.tripNum.textColor = self.trip.textColor = defaultTextColor;
    self.commentNum.textColor = self.comment.textColor = defaultTextColor;



    PersonalHeaderVectorType selectVectorType = self.lastSelectIndex;
    UIColor *selectTextColor = UIColorFromRGB(0x00b7ff);
    switch (selectVectorType) {
        case 0:
            self.collectionNum.textColor = self.collection.textColor = selectTextColor;
            break;
        case 1:
            self.tripNum.textColor = self.trip.textColor = selectTextColor;
            break;
        case 2:
            self.commentNum.textColor = self.comment.textColor = selectTextColor;
            break;
    }
}





- (void)setSelectVectorType:(PersonalHeaderVectorType)vectorType {
    if (vectorType == self.lastSelectIndex) {
        return;
    }
    [self resetTextColor:self.lastSelectIndex];
    self.lastSelectIndex = vectorType;
    switch (vectorType) {
        case PersonalHeaderVectorTypeHome:
            self.collectionNum.textColor = self.collection.textColor = UIColorFromRGB(0x00b7ff);
            break;
        case PersonalHeaderVectorTypeWeiBo:
            self.tripNum.textColor = self.trip.textColor = UIColorFromRGB(0x00b7ff);
            break;
        case PersonalHeaderVectorTypeAlbum:
            self.commentNum.textColor = self.comment.textColor = UIColorFromRGB(0x00b7ff);
            break;
    }
    if (_delegate && [_delegate respondsToSelector:@selector(personalHeaderVectorDidClick:)]) {
        [_delegate personalHeaderVectorDidClick:vectorType];
    }
}

- (void)resetTextColor:(NSInteger)tag {
    UIColor *defaultTextColor = [UIColor whiteColor];
    if (_vectorViewStyle == PersonalHeaderVectorViewStyleWhite) {
        defaultTextColor = UIColorFromRGB(0x666666);
    }

    switch (tag) {
        case 0:
            self.collectionNum.textColor = self.collection.textColor = defaultTextColor;
            break;
        case 1:
            self.tripNum.textColor = self.trip.textColor = defaultTextColor;
            break;
        case 2:
            self.commentNum.textColor = self.comment.textColor = defaultTextColor;
            break;
    }
}


#pragma mark -
#pragma mark OverRide Method
//重写hitTest方法，来监听View内想要响应事件的视图点击，目的是为了让其他非可点击的部分不响应响应点击事件
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    //判断当前手指是否点击到我们想要响应事件的视图上，如果是，则响应处理事件，其他则由系统处理
    
    //首先判断当前View是否被隐藏了，隐藏了就不需要处理了
    if (self.isHidden == NO) {
        //将当前View的触摸点转换坐标系，转换到头像视图的身上，生成一个新的点
        CGPoint newP = [self convertPoint:point toView:self.userAvatar];
        //判断如果这个新的点是在头像视图身上，那么处理点击事件最合适的view就是头像视图
        if ( [self.userAvatar pointInside:newP withEvent:event]) {
            return self.userAvatar;
        }
    
 
        // 以下同上
        CGPoint newBtnP = [self convertPoint:point toView:self.firstBtn];
        if ( [self.firstBtn pointInside:newBtnP withEvent:event]) {
            return self.firstBtn;
        }
        
        newBtnP = [self convertPoint:point toView:self.secondBtn];
        if ( [self.secondBtn pointInside:newBtnP withEvent:event]) {
            return self.secondBtn;
        }
        
        newBtnP = [self convertPoint:point toView:self.thirdBtn];
        if ( [self.thirdBtn pointInside:newBtnP withEvent:event]) {
            return self.thirdBtn;
        }
    }
    // 其他情况本View 不处理，交由系统去处理
    return nil;
}

#pragma mark -
#pragma mark getter/setter


#pragma mark -
#pragma mark Class Method
+ (instancetype)loadForNib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
}

@end
