//
//  ViewController.m
//  4-6Playertest
//
//  Created by tusm on 16/4/6.
//  Copyright © 2016年 tusm. All rights reserved.
//
#define APPWIDTH  [ UIScreen mainScreen ].bounds.size.width
#define APPHEIGHT  [ UIScreen mainScreen ].bounds.size.height


#import "threeViewController.h"
#import "middleViewController.h"
#import "XnavigationViewController.h"

@interface middleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *TableView;
@property(nonatomic,assign)CGFloat banAlpar;



@end

@implementation middleViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    

    
    [self makeTableView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(tap)];
    
    self.title = @"测试";
    
    


    
}







-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:self.banAlpar];
  
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    
    NSLog(@"---------viewWillDisappear--------");
    
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:1];
 
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    NSLog(@"---------viewDidDisappear--------");

}
-(void)tap
{
    
    UIViewController *two =[[UIViewController alloc] init];
    two.view.backgroundColor =[UIColor orangeColor];
    two.title = @"two";
    
    [self.navigationController pushViewController:two animated:YES];
    
}

-(void)makeTableView
{
    self.TableView =[[UITableView alloc] initWithFrame:CGRectMake(0,-64, APPWIDTH, APPHEIGHT) style:UITableViewStylePlain];
    self.TableView.delegate = self;
    self.TableView.dataSource = self;
    [self.view addSubview:self.TableView];
    
    
    UIImageView *item  =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APPWIDTH, 300)];
    item.image = [UIImage imageNamed:@"head.jpg"];
    item.contentMode = UIViewContentModeScaleToFill;
    self.TableView.tableHeaderView = item;
    
    
 
 }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 20;
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
    
    UIColor *color = indexPath.row % 2 == 0 ? [UIColor redColor] : [UIColor greenColor];
    
    cell.contentView.backgroundColor = color;
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.navigationController pushViewController:[[threeViewController alloc] init]  animated:YES];
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   
    self.banAlpar = scrollView.contentOffset.y/236;
    
    NSLog(@"-------scrollViewDidScroll---%lf---%lf",scrollView.contentOffset.y,scrollView.contentOffset.y/236);
    
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:self.banAlpar];

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
