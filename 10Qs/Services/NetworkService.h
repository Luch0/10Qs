//
//  NetworkService.h
//  10Qs
//
//  Created by Luis Calle on 10/10/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NetworkService : NSObject

+ (instancetype)sharedManager;

- (void)performRequestWithRequest:(NSURLRequest *)request completionHandler:(void(^)(NSError *error, NSData *data))completion;

@end

NS_ASSUME_NONNULL_END
