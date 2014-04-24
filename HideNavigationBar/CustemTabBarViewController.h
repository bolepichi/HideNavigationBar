//
//  CustemTabBarViewController.h
//  HideNavigationBar
//
//  Created by Coolin 006 on 13-9-10.
//  Copyright (c) 2013年 CoolinSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustemTabBarViewController : UITabBarController

{
    int currentSelectedIndex;
    //UIButton *btn;
    NSMutableArray *buttons;
    UIImageView *slideBg;
    UIView *custemTabbarView;
}


@property(nonatomic,assign)int currentSelectedIndex;
//@property(nonatomic,retain)UIButton *btn;
@property(nonatomic,retain)NSMutableArray *buttons;

-(void)CustemTabBar;
-(void)selectedTab:(UIButton*)button;

@end
