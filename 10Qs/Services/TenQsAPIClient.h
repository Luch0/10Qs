//
//  TenQsAPIClient.h
//  10Qs
//
//  Created by Luis Calle on 10/10/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"


NS_ASSUME_NONNULL_BEGIN

@interface TenQsAPIClient : NSObject

+ (void)fetchQuestions:(void (^)(NSError *, NSArray<Question *> *))completion;

@end

NS_ASSUME_NONNULL_END
