//
//  TestRefresh.h
//  XJJRefresh
//
//  Created by GaoDun on 15/11/19.
//  Copyright © 2015年 ljw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJJRefreshHeader.h"

@interface TestRefresh : UIView <XJJRefreshHeader>

@property (nonatomic, copy) XJJRefreshBlock refreshBlock;

@property (nonatomic, assign) XJJRefreshState refreshState;

@property (nonatomic, strong) UIActivityIndicatorView *act;

@end
