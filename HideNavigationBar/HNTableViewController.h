//
//  HNTableViewController.h
//  HideNavigationBar
//
//  Created by Coolin 006 on 13-9-3.
//  Copyright (c) 2013年 CoolinSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HNTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>


@property(nonatomic,retain)UIView *title_View;

@property(nonatomic,retain)UITableView *table_View;

@property(nonatomic,assign)float contentsetY;

@end
