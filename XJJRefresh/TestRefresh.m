//
//  TestRefresh.m
//  XJJRefresh
//
//  Created by GaoDun on 15/11/19.
//  Copyright © 2015年 ljw. All rights reserved.
//

#import "TestRefresh.h"
#import "UIScrollViewScrollInfo.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface TestRefresh ()


@end

@implementation TestRefresh

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.act = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        self.act.frame = self.bounds;
        self.act.hidesWhenStopped = NO;
        [self addSubview:self.act];
    }
    return self;
}

- (CGPoint)startPosition
{
    return CGPointMake(kScreenWidth / 2 - self.frame.size.width / 2, - self.frame.size.height);
}

- (CGPoint)refreshingPosition
{
    return CGPointMake(kScreenWidth / 2 - self.frame.size.width / 2, 44.f);
}

- (void)didUpdateStateChangedWithState:(XJJRefreshState)state scrollInfo:(UIScrollViewScrollInfo *)info
{
    
    if (self.refreshState != XJJRefreshStateRefreshing &&  info.scrollDirection == UIScrollViewScrollDirectionToBottom) {
        self.act.transform = CGAffineTransformRotate(self.act.transform, -info.contentOffsetSection.y * 36  / 360 * M_2_PI);
    }
    
    if (self.refreshState != XJJRefreshStateRefreshing &&  info.scrollDirection == UIScrollViewScrollDirectionToTop) {
        self.act.transform = CGAffineTransformRotate(self.act.transform, info.contentOffsetSection.y * 36  / 360 * M_2_PI);
    }
    
    switch (self.refreshState) {
        case XJJRefreshStateIdle:
        {
            [self.act stopAnimating];
        }
            break;
        case XJJRefreshStateRefreshing:
        {
            [self.act startAnimating];
        }
            break;
            
        default:
            break;
    }
}

@end
