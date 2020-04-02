//
//  main.m
//  ProxyConfigHelper
//
//  Created by yichengchen on 2019/8/16.
//  Copyright © 2019 west2online. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProxyConfigHelper.h"
#import <AppKit/AppKit.h>
#import "PathUtils.h"
int main(int argc, const char * argv[]) {
//    NSURL *url = [NSURL fileURLWithPath:@"/Users/etan.chen/Code/clashX/ClashX.app"];
//    NSWorkspaceOpenConfiguration *config = [[NSWorkspaceOpenConfiguration alloc] init];
//    config.arguments = @[@"-AppleLanguages",@"'(en)'"];
//    [PathUtils runCommand:@"/usr/bin/open" args:@[@"/Users/etan.chen/Code/clashX/ClashX.app"]];
    
    [[NSWorkspace sharedWorkspace] openFile:@"/Users/etan.chen/Code/clashX/ClashX.app"];
    
    @autoreleasepool {
        [[ProxyConfigHelper new] run];
        NSLog(@"ProxyConfigHelper exit");
    }
    return 0;
}
