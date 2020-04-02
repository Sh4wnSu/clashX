//
//  PathUtils.h
//  ClashX
//
//  Created by Etan Chen on 2020/4/2.
//  Copyright © 2020 west2online. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PathUtils : NSObject
+ (NSString *)getUserHomePath;
+ (NSString *)runCommand:(NSString *)path args:(NSArray *)args;
@end

NS_ASSUME_NONNULL_END
