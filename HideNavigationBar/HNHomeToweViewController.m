//
//  HNHomeToweViewController.m
//  HideNavigationBar
//
//  Created by Coolin 006 on 13-9-10.
//  Copyright (c) 2013年 CoolinSoft. All rights reserved.
//

#import "HNHomeToweViewController.h"
#import  "HNTableViewController.h"
@interface HNHomeToweViewController ()

@end

@implementation HNHomeToweViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(100, 100, 80, 30);
    [button setTitle:@"前往" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(Go) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    
	// Do any additional setup after loading the view.
}


-(void)Go
{
    HNTableViewController *table=[[[HNTableViewController alloc]init]autorelease];
    
    table.hidesBottomBarWhenPushed=YES;
    
    [self.navigationController pushViewController:table animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
