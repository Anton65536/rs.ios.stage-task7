//
//  AppDelegate.m
//  rs.ios.crosscheck.task7
//
//  Created by Anton Petrash on 05/07/2021.
//

#import "AppDelegate.h"
#import "APLoginVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIViewController *rootVC  = [[APLoginVC alloc] initWithNibName:@"APLoginVC" bundle:nil];
    window.rootViewController = rootVC;
    self.window = window;
    [self.window makeKeyAndVisible];
    return YES;
}





@end
