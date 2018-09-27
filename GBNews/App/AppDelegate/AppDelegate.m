//
//  AppDelegate.m
//  GBNews
//
//  Created by Maxim Tolstikov on 25/09/2018.
//  Copyright © 2018 Maxim Tolstikov. All rights reserved.
//

#import "AppDelegate.h"
#import "NewsListTableViewController.h"
#import "DataProvider.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    DataProvider *dataProvider = [DataProvider new];
    NewsListTableViewController *newsListController = [[NewsListTableViewController alloc]
                                                       initWithDataProvider:dataProvider];
    self.window.rootViewController = [[UINavigationController alloc]
                                      initWithRootViewController:newsListController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
