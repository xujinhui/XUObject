//
//  XnavigationViewController.m
//  XUObject
//
//  Created by sara on 16/4/20.
//  Copyright © 2016年 xuewuguojie. All rights reserved.
//

#import "XnavigationViewController.h"

@interface XnavigationViewController ()

@end

@implementation XnavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationBar setTitleTextAttributes:@{
                                  NSForegroundColorAttributeName :[UIColor redColor]
                                  }];
    
    
      self.navigationBar.tintColor = [UIColor  purpleColor];
    
      [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg"] forBarMetrics:UIBarMetricsDefault];
    
     

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
