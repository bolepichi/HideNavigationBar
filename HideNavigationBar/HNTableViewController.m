//
//  HNTableViewController.m
//  HideNavigationBar
//
//  Created by Coolin 006 on 13-9-3.
//  Copyright (c) 2013年 CoolinSoft. All rights reserved.
//

#import "HNTableViewController.h"

@interface HNTableViewController ()

@end

@implementation HNTableViewController


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
	// Do any additional setup after loading the view.
    
    
      [[NSNotificationCenter defaultCenter] postNotificationName:@"hidenTabbar" object:nil];
    
    self.table_View=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    self.table_View.delegate=self;
    self.table_View.dataSource=self;
    [self.view addSubview:self.table_View];
    [self.table_View release];
    
    self.title_View=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    self.title_View.backgroundColor=[UIColor blueColor];
    [self.view addSubview:self.title_View];
    
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(110, 7, 100, 30)];
    label.text=@"主页";
    label.textColor=[UIColor whiteColor];
    label.backgroundColor=[UIColor clearColor];
    label.textAlignment=NSTextAlignmentCenter;
    [self.title_View addSubview:label];
    [label release];
    
    
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    button.frame=CGRectMake(0, 0, 80, 30);
    [button addTarget:self action:@selector(Backview) forControlEvents:UIControlEventTouchUpInside];
    [self.title_View addSubview:button];

    
    
    [self.title_View release];
    
    self.contentsetY=0;
}

-(void)Backview
{
   
    
    [self.navigationController popViewControllerAnimated:YES];
     [[NSNotificationCenter defaultCenter] postNotificationName:@"showTabbar" object:nil];
}


-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}



-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *stringIndentifier=@"strintrfier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:stringIndentifier];
    if (cell==nil) {
        cell=[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stringIndentifier]autorelease];
    }
    
    cell.textLabel.text=[NSString stringWithFormat:@"cell%d",indexPath.row];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.frame.size.height>=scrollView.contentSize.height) {
        return;
    }
    
    if ((self.contentsetY-scrollView.contentOffset.y)>0) {
        NSLog(@"向下滑动");
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        self.title_View.frame=CGRectMake(0, 0, 320, 44);
        [UIView commitAnimations];
        
        
        if ((scrollView.contentOffset.y+self.view.frame.size.height+44)>=scrollView.contentSize.height) {
             self.title_View.frame=CGRectMake(0, -44, 320, 44);
            self.table_View.frame=CGRectMake(0, 0, 320, self.view.frame.size.height);
        }
        else
        {
            self.table_View.frame=CGRectMake(0, 44, 320, self.view.frame.size.height);
        }
    } 
    else if((self.contentsetY-scrollView.contentOffset.y)<0)
    {
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        self.title_View.frame=CGRectMake(0, -44, 320, 44);
        [UIView commitAnimations];
        
        if (scrollView.contentOffset.y<=0) {
            self.title_View.frame=CGRectMake(0, 0, 320, 44);
            self.table_View.frame=CGRectMake(0, 44, 320, self.view.frame.size.height);
        }
        else
        {
            self.table_View.frame=CGRectMake(0, 0, 320, self.view.frame.size.height);
        }
        
               NSLog(@"向上滑动");
    }
    
    self.contentsetY=scrollView.contentOffset.y;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc
{
    [_table_View release];
    [_title_View release];
    [super dealloc];
}

@end
