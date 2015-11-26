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

/** 刷新时调用的block */
@property (nonatomic, copy) XJJRefreshBlock refreshBlock;

/** 刷新的状态，建议不要手动修改 */
@property (nonatomic, assign) XJJRefreshState refreshState;

/** 起始位置，相对于scrollView顶部，不是scrollView的origin */
@property (nonatomic, assign) CGPoint startPosition;

/** 刷新时的位置，相对于scrollView顶部，不是scrollView的origin (横坐标x暂时没卵用,请设置成和startPosition.x一样) */
@property (nonatomic, assign) CGPoint refreshingPosition;

/** 刷新控件的类型 */
@property (nonatomic, assign, readonly) XJJHolyCrazyHeaderType type;

/** type为XJJHolyCrazyHeaderTypeCustom时将会使用此view */
@property (nonatomic, strong) UIView *customContentView;

/** 请用此方式初始化, 如果选择custom 请设置customContentView */
+ (instancetype)holyCrazyHeaderWithType:(XJJHolyCrazyHeaderType)type size:(CGSize)size;

/** 通过indicator的类型，初始化一个默认的刷新控件 */
+ (instancetype)holyCrazyDeafaultHeaderWithIndicatorStyle:(UIActivityIndicatorViewStyle)style;

@end
