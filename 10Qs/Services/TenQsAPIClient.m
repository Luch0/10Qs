//
//  TenQsAPIClient.m
//  10Qs
//
//  Created by Luis Calle on 10/10/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import "TenQsAPIClient.h"
#import "NetworkService.h"


@implementation TenQsAPIClient

+ (void)fetchQuestions:(void (^)(NSError *, NSArray<Question *> *))completion {
    
    NSString *searchURLString = @"https://opentdb.com/api.php?amount=10";
    NSURL *url = [NSURL URLWithString:searchURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [[NetworkService sharedManager] performRequestWithRequest:request completionHandler:^(NSError *error, NSData *data) {
        if (error) {
            completion(error, nil);
        } else {
            if (data) {
                NSMutableArray <Question *> *questions = [[NSMutableArray alloc] init];
                NSDictionary *questionsResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                NSArray<NSDictionary *> *results = questionsResponse[@"results"];
                if (error) {
                    completion(error, nil);
                } else {
                    for (NSDictionary *questionDictionary in results) {
                        Question *question = [[Question alloc] initWithDictionary:questionDictionary];
                        [questions addObject:question];
                    }
                    completion(nil, questions);
                }
            } else {
                completion(error, nil);
            }
        }
    }];
}

@end
