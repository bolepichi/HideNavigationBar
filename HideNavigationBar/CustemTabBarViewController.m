//
//  CustemTabBarViewController.m
//  HideNavigationBar
//
//  Created by Coolin 006 on 13-9-10.
//  Copyright (c) 2013年 CoolinSoft. All rights reserved.
//

#import "CustemTabBarViewController.h"
#import "HNHomeToweViewController.h"
#import "HNClassOneViewController.h"
#import "HNBagOneViewController.h"
#import "HNMoreOneViewController.h"

@interface CustemTabBarViewController ()

@end

@implementation CustemTabBarViewController
//@synthesize btn;
@synthesize buttons;
@synthesize currentSelectedIndex;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hidenTabbar) name:@"hidenTabbar"object: nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTabbar) name:@"showTabbar"object: nil];
    
    
    
    HNHomeToweViewController *homeroot=[[[HNHomeToweViewController alloc]init]autorelease];
    UINavigationController *navHome=[[[UINavigationController alloc]initWithRootViewController:homeroot]autorelease];
    navHome.navigationBarHidden=YES;
    
    HNClassOneViewController *classroot=[[[HNClassOneViewController alloc]init]autorelease];
    UINavigationController *navClass=[[[UINavigationController alloc]initWithRootViewController:classroot]autorelease];
    navClass.navigationBarHidden=YES;
    
    HNBagOneViewController *bagroot=[[[HNBagOneViewController alloc]init]autorelease];
    UINavigationController *navBag=[[[UINavigationController alloc]initWithRootViewController:bagroot]autorelease];
    navBag.navigationBarHidden=YES;
    
    HNMoreOneViewController *moreroot=[[[HNMoreOneViewController alloc]init]autorelease];
    UINavigationController *navMore=[[[UINavigationController alloc]initWithRootViewController:moreroot]autorelease];
    navMore.navigationBarHidden=YES;
    [self setViewControllers:[NSArray arrayWithObjects:navHome,navClass,navBag,navMore,nil]];
    
    [self CustemTabBar];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void)CustemTabBar{
  
   
    
    custemTabbarView =[[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-49, 320, 49)];
    custemTabbarView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:custemTabbarView];
    
    slideBg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320/4, 49)];
    slideBg.image=[UIImage imageNamed:@"orange"];
    [custemTabbarView addSubview:slideBg];
    [slideBg release];
    
    self.buttons=[NSMutableArray arrayWithCapacity:4];
    
    for (int i=0; i<4; i++) {
        
        UIButton * btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(i*(320/4), 0, 320/4, 49);
        btn.tag=i;
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"bar%d",i]] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.buttons addObject:btn];
        
        [custemTabbarView addSubview:btn];
        
    }
    
    [custemTabbarView release];
    
    [self performSelector:@selector(slideTabBg:) withObject:[self.buttons objectAtIndex:0]];
    
}
-(void)selectedTab:(UIButton*)button{
    self.currentSelectedIndex = button.tag;
	self.selectedIndex = self.currentSelectedIndex;
	[self performSelector:@selector(slideTabBg:) withObject:button];
}
//滑块切换动画
-(void)slideTabBg:(UIButton*)button{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    slideBg.frame=button.frame;
    [UIView commitAnimations];
}
//隐藏
-(void)hidenTabbar
{
    [self.tabBar setHidden:YES];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    custemTabbarView.frame=CGRectMake(0, self.view.frame.size.height, 320, 49);
    [UIView commitAnimations];
}

//显示
-(void)showTabbar
{
    [self.tabBar setHidden:YES];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    custemTabbarView.frame=CGRectMake(0, self.view.frame.size.height-49, 320, 49);
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(void)dealloc
{
    //[btn release];
    [buttons release];
    [super dealloc];
}

@end
