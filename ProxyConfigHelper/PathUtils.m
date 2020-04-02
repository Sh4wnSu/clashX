//
//  PathUtils.m
//  ClashX
//
//  Created by Etan Chen on 2020/4/2.
//  Copyright © 2020 west2online. All rights reserved.
//

#import "PathUtils.h"
#import <SystemConfiguration/SystemConfiguration.h>
#include <unistd.h>
#include <sys/types.h>
#include <pwd.h>
@implementation PathUtils
+ (NSString *)getUserHomePath {
    SCDynamicStoreRef store = SCDynamicStoreCreate(NULL, CFSTR("com.west2online.ClashX.ProxyConfigHelper"), NULL, NULL);
    CFStringRef CopyCurrentConsoleUsername(SCDynamicStoreRef store);
    CFStringRef result;
    uid_t uid;
    result = SCDynamicStoreCopyConsoleUser(store, &uid, NULL);
    if ((result != NULL) && CFEqual(result, CFSTR("loginwindow"))) {
        CFRelease(result);
        result = NULL;
        CFRelease(store);
        return nil;
    }
    CFRelease(result);
    result = NULL;
    CFRelease(store);
    char *dir = getpwuid(uid)->pw_dir;
    NSString *path = [NSString stringWithUTF8String:dir];
    return path;
}


+ (NSString *)runCommand:(NSString *)path args:(NSArray *)args {
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:path];
    [task setArguments:args];
    
    NSPipe *pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];

    NSFileHandle *file = [pipe fileHandleForReading];

    [task launch];

    NSData *data = [file readDataToEndOfFile];

    return [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
}
@end
