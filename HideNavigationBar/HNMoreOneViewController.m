//
//  HNMoreOneViewController.m
//  HideNavigationBar
//
//  Created by Coolin 006 on 13-9-10.
//  Copyright (c) 2013年 CoolinSoft. All rights reserved.
//

#import "HNMoreOneViewController.h"

@interface HNMoreOneViewController ()

@end

@implementation HNMoreOneViewController

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
	
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(110, 7, 100, 30)];
    label.text=@"更多";
    label.textColor=[UIColor blackColor];
    label.backgroundColor=[UIColor clearColor];
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label release];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
