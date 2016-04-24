//
//  threeViewController.m
//  XUObject
//
//  Created by xuewuguojie on 16/4/20.
//  Copyright © 2016年 xuewuguojie. All rights reserved.
//
#define APPWIDTH  [ UIScreen mainScreen ].bounds.size.width
#define APPHEIGHT  [ UIScreen mainScreen ].bounds.size.height
#import "threeViewController.h"
#import "XnavigationViewController.h"

@interface threeViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIImageView *barTitleLab;
@property(nonatomic,strong)UIWebView *web;

@end

@implementation threeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"three";
     self.barTitleLab =[[UIImageView alloc] initWithFrame:CGRectMake(0, -64, 320, 64)];
    self.barTitleLab.clipsToBounds = YES;
    self.barTitleLab.contentMode = UIViewContentModeScaleToFill;
    self.barTitleLab.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:self.barTitleLab];
    
    
    self.web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.web.backgroundColor =[UIColor lightGrayColor];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.myoffer.cn"]];
    [self.view addSubview: self.web];
    [self.web loadRequest:request];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:1];
    
    
    NSLog(@"-----three----viewWillAppear--------");


}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    
    NSLog(@"-----three----viewWillDisappear--------");

    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
