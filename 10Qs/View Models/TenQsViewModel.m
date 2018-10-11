//
//  TenQsViewModel.m
//  10Qs
//
//  Created by Luis Calle on 10/10/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import "TenQsViewModel.h"
#import <UIKit/UIKit.h>

@implementation TenQsViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _questions = [[NSArray alloc] init];
    }
    return self;
}

- (void)fetchQuestions
{
    [TenQsAPIClient fetchQuestions:^(NSError *error, NSArray<Question *> *questions) {
        if (error) {
            [self.delegate viewModeldidFinishWith:TenQsViewModelStateFail];
        } else {
            self.questions = questions;
            [self.delegate viewModeldidFinishWith:TenQsViewModelStateSucceed];
        }
    }];
}

- (NSString *)getQuestionTextAtSection:(NSInteger)section
{
    return [[_questions objectAtIndex:section] question];
}

- (NSString *)getAnswerChoiceAtIndexPath:(NSIndexPath *)indexPath
{
    return [[[_questions objectAtIndex:indexPath.section] allAnswers] objectAtIndex:indexPath.row];
}

- (NSUInteger)numberOfQuestions
{
    return [_questions count];
}

- (NSUInteger)numberOfChoicesInQuestion:(NSInteger)section
{
    return [[[_questions objectAtIndex:section] allAnswers] count];
}

@end
