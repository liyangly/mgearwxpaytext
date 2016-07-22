//
//  AppDelegate.m
//  mgearwxpaytext01
//
//  Created by 李阳 on 16/7/21.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "AppDelegate.h"

#import "WXApiManager.h"
#import "WXPayViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  [self customizeInterface];
  [self initRootViewController];
  // 注册微信支付
  [WXApi registerApp:WX_APPID withDescription:@"demo 2.0"];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state.
  // This can occur for certain types of temporary interruptions (such as an
  // incoming phone call or SMS message) or when the user quits the application
  // and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down
  // OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate
  // timers, and store enough application state information to restore your
  // application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called
  // instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state;
  // here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the
  // application was inactive. If the application was previously in the
  // background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if
  // appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -Private Method
/**
 *  初始化导航状态栏
 */
- (void)customizeInterface {

  UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
  NSDictionary *textAttributes = nil;
  if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
    textAttributes = @{
      NSFontAttributeName : [UIFont boldSystemFontOfSize:18.0f],
      NSForegroundColorAttributeName : [UIColor whiteColor]
    };
  } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    textAttributes = @{
      UITextAttributeFont : [UIFont boldSystemFontOfSize:18],
      UITextAttributeTextColor : [UIColor whiteColor],
      UITextAttributeTextShadowColor : [UIColor clearColor],
      UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero]
    };
#endif
  }

  [navigationBarAppearance setBackgroundColor:[UIColor cyanColor]];
  [navigationBarAppearance setTitleTextAttributes:textAttributes];
  navigationBarAppearance.tintColor = [UIColor whiteColor];
}

/**
 *  初始化控制器堆栈
 */
- (void)initRootViewController {

  WXPayViewController *rootVC = [[WXPayViewController alloc] init];
  UINavigationController *navVC =
      [[UINavigationController alloc] initWithRootViewController:rootVC];
  self.window.rootViewController = navVC;
  [self.window makeKeyAndVisible];
}

#pragma mark - 微信支付回调

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
  return [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
  return [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
}

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<NSString *, id> *)options {
  return [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
}

@end
