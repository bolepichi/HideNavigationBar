//
//  HNBagOneViewController.m
//  HideNavigationBar
//
//  Created by Coolin 006 on 13-9-10.
//  Copyright (c) 2013年 CoolinSoft. All rights reserved.
//

#import "HNBagOneViewController.h"
#import <sqlite3.h>
#import "FMDatabase.h"
@interface HNBagOneViewController ()

@end

@implementation HNBagOneViewController

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
	// Do any additional setup after loading the view.
    
    
    
    
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(110, 7, 100, 30)];
    label.text=@"书包";
    label.textColor=[UIColor blackColor];
    label.backgroundColor=[UIColor clearColor];
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label release];
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory=[paths objectAtIndex:0];
    // dbpath : 数据库路径，在Document中
    NSString *dbpath=[documentDirectory stringByAppendingPathComponent:@"Test.db"];
    //创建数据库实例 db 这里说明下:如果路径中不存在“Test.db”的文件，sqlite会自动创建"Test.db"
    self.db=[[[FMDatabase alloc]init]autorelease];
    self.db=[FMDatabase databaseWithPath:dbpath];
    if (![self.db open]) {
        NSLog(@"Could't open db.");
        return;
    }
   

    [self.db executeUpdate:@"CREATE TABLE User (Name text,Age integer)"];
    
    [self.db executeUpdate:@"INSERT INTO User (Name,Age) VALUES (?,?)",@"Ronadlo",[NSNumber numberWithInt:20]];

    for (int i=1; i<=100; i++) {
        [self.db executeUpdate:@"INSERT INTO User (Name,Age) VALUES (?,?)",[NSString stringWithFormat:@"韩笑白-%d",i],[NSNumber numberWithInt:20]];
    }
    
    FMResultSet *rs=[self.db executeQuery:@"SELECT * FROM User"];
    rs=[self.db executeQuery:@"SELECT * FROM User WHERE Age = ?",@"20"];
    while ([rs next]){
        NSLog(@"%@ %@",[rs stringForColumn:@"Name"],[rs stringForColumn:@"Age"]);
    }

    
}









-(void)dealloc
{
    [_db release];
    [super dealloc];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
