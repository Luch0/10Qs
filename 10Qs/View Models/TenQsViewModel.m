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
    NSString *questionText = [[self.questions objectAtIndex:section] question];
    return [self decodeString:questionText];
}

- (NSString *)getAnswerChoiceAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *answerChoiceText = [[[self.questions objectAtIndex:indexPath.section] allAnswers] objectAtIndex:indexPath.row];
    return [self decodeString:answerChoiceText];
}

- (NSUInteger)numberOfQuestions
{
    return [self.questions count];
}

- (NSUInteger)numberOfChoicesInQuestion:(NSInteger)section
{
    return [[[self.questions objectAtIndex:section] allAnswers] count];
}

- (NSString *)decodeString:(NSString *)encodedString
{
    NSAttributedString *formattedString = [[NSAttributedString alloc] initWithData:[encodedString dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: [NSNumber numberWithInt:NSUTF8StringEncoding]} documentAttributes:nil error:nil];
    return formattedString.string;
}

@end
