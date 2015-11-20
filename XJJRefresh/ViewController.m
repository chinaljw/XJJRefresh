//
//  ViewController.m
//  XJJRefresh
//
//  Created by GaoDun on 15/11/19.
//  Copyright © 2015年 ljw. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+XJJRefresh.h"
#import "TestRefresh.h"
#import "TestZoomingHeaderView.h"
#import "UIScrollView+LJWZoomingHeader.h"
#import "XJJHolyCrazyHeader.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong) TestZoomingHeaderView *testHeaderView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.scrollView.contentSize = CGSizeMake(0, 1000.f);
    
//    TestRefresh *refresh = [[TestRefresh alloc] initWithFrame:CGRectMake(0, 0, 44.f, 44.f)];
//    refresh.backgroundColor = [UIColor orangeColor];
    
    [self.scrollView addZoomingHeaderView:self.testHeaderView];
    
    XJJHolyCrazyHeader *crazyRefresh = [XJJHolyCrazyHeader holyCrazyHeaderWithType:XJJHolyCrazyHeaderTypeCustom size:CGSizeMake(44.f, 44.f)];
    crazyRefresh.startPosition = CGPointMake(0, -44.f);
    crazyRefresh.refreshingPosition = CGPointMake(0, 64.f);
    UIView *customView = [[UIView alloc] initWithFrame:crazyRefresh.bounds];
    customView.backgroundColor = [UIColor orangeColor];
    crazyRefresh.customContentView = customView;
    
    __weak typeof(self) weakSelf = self;
    [self.scrollView add_xjj_refreshHeader:crazyRefresh refreshBlock:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.scrollView end_xjj_refresh];
        });
        
        [weakSelf.scrollView replace_xjj_refreshBlock:^{
            NSLog(@"sss");
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.scrollView end_xjj_refresh];
            });
        }];
        
    }];
    
    [self.scrollView begin_xjj_refresh];
    
//    [self.scrollView remove_xjj_refreshHeader];
    
//    [self removeObserver:nil forKeyPath:@""];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Test
- (TestZoomingHeaderView *)testHeaderView
{
    //给出合适的高宽，乱来的话我也不知道会怎样~
    TestZoomingHeaderView *headerView = [[TestZoomingHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300.f)];
//    headerView.backgroundColor = [UIColor orangeColor];
    
    return headerView;
}

- (void)dealloc
{
    NSLog(@"dealloc %@", self);
}

@end
