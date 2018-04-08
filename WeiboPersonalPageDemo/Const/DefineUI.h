//
//  DefineUI.h
//  WeiboPersonalPageDemo
//
//  Created by JasonYan on 2018/4/8.
//  Copyright © 2018年 JasonYan. All rights reserved.
//

#ifndef DefineUI_h
#define DefineUI_h

#define UIColorFromRGB(rgbValue) [UIColor                       \
colorWithRed:(float)(((rgbValue & 0xFF0000) >> 16) / 255.0) \
green:(float)(((rgbValue & 0xFF00) >> 8) / 255.0)    \
blue:(float)((rgbValue & 0xFF) / 255.0)             \
alpha:1.0]

#define UIColorFromRGBA(rgbaValue) [UIColor                        \
colorWithRed:(float)(((rgbaValue & 0xFF000000) >> 16) / 255.0) \
green:(float)(((rgbaValue & 0xFF0000) >> 8) / 255.0)    \
blue:(float)((rgbaValue & 0xFF00) / 255.0)             \
alpha:(float)((rgbaValue & 0xFF) / 255.0)]

#define UIColorFromRGBAlpha(rgb, a) [UIColor            \
colorWithRed:(float)(((rgb >> 16) & 0xFF) / 255.0f) \
green:(((rgb >> 8) & 0xFF) / 255.0f)         \
blue:(((rgb)&0xFF) / 255.0f)                \
alpha:a]

#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define ScreenWidth [UIScreen mainScreen].bounds.size.width


#define onePX (1 / [[UIScreen mainScreen] scale]) // 一像素

#endif /* DefineUI_h */
