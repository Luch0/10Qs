//
//  NetworkService.m
//  10Qs
//
//  Created by Luis Calle on 10/10/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import "NetworkService.h"


@interface NetworkService ()

@property (nonatomic) NSURLSession *urlSession;

@end

@implementation NetworkService

+ (instancetype)sharedManager {
    static NetworkService *networkService;
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networkService = [[NetworkService alloc] init];
    });
    return networkService;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _urlSession = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration];
    }
    return self;
}

- (void)performRequestWithRequest:(NSURLRequest *)request completionHandler:(void(^)(NSError *error, NSData *data))completion
{
    [[self.urlSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                completion(error, nil);
            } else {
                completion(nil, data);
            }
        });
    }] resume];
}

@end
