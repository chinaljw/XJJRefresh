//
//  XJJHolyCrayRefreshHeader.h
//  XJJRefresh
//
//  Created by ljw on 15/11/19.
//  Copyright © 2015年 ljw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJJRefreshHeader.h"

typedef NS_ENUM(NSInteger, XJJHolyCrazyHeaderType)
{
    XJJHolyCrazyHeaderTypeDefault = 0,
    XJJHolyCrazyHeaderTypeCustom = 1,
};

@interface XJJHolyCrazyHeader : UIView <XJJRefreshHeader>

@property (nonatomic, copy) XJJRefreshBlock refreshBlock;

@property (nonatomic, assign) XJJRefreshState refreshState;

@property (nonatomic, assign) CGPoint startPosition;

@property (nonatomic, assign) CGPoint refreshingPosition;

@property (nonatomic, assign, readonly) XJJHolyCrazyHeaderType type;

/** type为XJJHolyCrazyHeaderTypeCustom时将会使用此view */
@property (nonatomic, strong) UIView *customContentView;

/** 请用此方式初始化, 如果选择custom 请设置customContentView */
+ (instancetype)holyCrazyHeaderWithType:(XJJHolyCrazyHeaderType)type size:(CGSize)size;

@end
