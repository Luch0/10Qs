//
//  Question.m
//  10Qs
//
//  Created by Luis Calle on 10/10/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import "Question.h"


@interface Question ()

@end


@implementation Question

- (instancetype)initWith:(NSString *)category
                    type:(NSString *)type
              difficulty:(NSString *)difficulty
                question:(NSString *)question
           correctAnswer:(NSString *)correctAnswer
        incorrectAnswers:(NSMutableArray<NSString *> *)incorrectAnswers
{
    self = [super init];
    if (self) {
        _category = category;
        _type = type;
        _difficulty = difficulty;
        _question = question;
        _correctAnswer = correctAnswer;
        _incorrectAnswers = incorrectAnswers;
        _allAnswers = [NSMutableArray arrayWithArray:incorrectAnswers];
        [_allAnswers addObject:correctAnswer];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)questionDictionary
{
    self = [super init];
    if (self) {
        if (questionDictionary[@"category"])
            _category = questionDictionary[@"category"];
        if (questionDictionary[@"type"])
            _type = questionDictionary[@"type"];
        if (questionDictionary[@"difficulty"])
            _difficulty = questionDictionary[@"difficulty"];
        if (questionDictionary[@"question"])
            _question = questionDictionary[@"question"];
        if (questionDictionary[@"correct_answer"])
            _correctAnswer = questionDictionary[@"correct_answer"];
        if (questionDictionary[@"incorrect_answers"])
            _incorrectAnswers = questionDictionary[@"incorrect_answers"];
        
        NSMutableArray<NSString *> *allAnswers = questionDictionary[@"incorrect_answers"];
        _allAnswers = [NSMutableArray arrayWithArray:allAnswers];
        NSString *correctAnswer = questionDictionary[@"correct_answer"];
        [_allAnswers addObject:correctAnswer];
    }
    return self;
}

@end
