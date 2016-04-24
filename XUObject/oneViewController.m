//
//  oneViewController.m
//  XUObject
//
//  Created by sara on 16/4/20.
//  Copyright © 2016年 xuewuguojie. All rights reserved.
//

#import "oneViewController.h"
#import "middleViewController.h"
#define APPWIDTH  [ UIScreen mainScreen ].bounds.size.width
#define APPHEIGHT  [ UIScreen mainScreen ].bounds.size.height
@interface oneViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *TableView;
@property(nonatomic,strong)UIImageView *barTitleLab;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,assign)BOOL isOpen;

@end

@implementation oneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"第一个页面>>>测试";
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    self.barTitleLab =[[UIImageView alloc] initWithFrame:CGRectMake(0, -64, 320, 64)];
    self.barTitleLab.clipsToBounds = YES;
    self.barTitleLab.contentMode = UIViewContentModeScaleToFill;
    self.barTitleLab.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:self.barTitleLab];
    
    
    
    self.titleLab =[[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 40)];
    [self.view addSubview:self.titleLab];
    
    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:@"baidu.com"];
    [str addAttribute: NSLinkAttributeName value: @"http://www.baidu.com" range: NSMakeRange(0, str.length)];
    self.titleLab.attributedText = str;
    
    
    
    
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(touch)];
    
//    [self makeTableView];
    
}

-(void)touch
{
    [self.navigationController pushViewController:[[middleViewController alloc] init]  animated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:1];
    
}


//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//  
//    [self.navigationController pushViewController:[[middleViewController alloc] init]animated:YES];
//    
//}



-(void)makeTableView
{
    self.TableView =[[UITableView alloc] initWithFrame:CGRectMake(0,0, APPWIDTH, APPHEIGHT) style:UITableViewStylePlain];
    self.TableView.delegate = self;
    self.TableView.dataSource = self;
    [self.view addSubview:self.TableView];
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    if (indexPath.row == 5 && self.isOpen) {
        
         return   120;

    }else{
    
        return   60;

    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 30;
}

static  NSString *identify = @"gonglue";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identify];
    
    if (!cell) {
        
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell %d",indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:@"papa"];
    
    if (indexPath.row == 5) {
        
        UIButton *sender =[UIButton buttonWithType:UIButtonTypeContactAdd];
        [sender addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
        cell.accessoryView = sender;
        [cell.contentView addSubview:sender];
    }else{
    
        cell.accessoryView = nil;

    }
    
    
    return cell;
    
}

-(void)tap:(UIButton *)sender
{
    UITableViewCell *cell = (UITableViewCell *)sender.superview;
    
    self.isOpen = !self.isOpen;
    
    
    NSIndexPath *indexPath = [self.TableView indexPathForCell:cell];

    [self.TableView  reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
}


@end
