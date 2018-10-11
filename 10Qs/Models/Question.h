//
//  Question.h
//  10Qs
//
//  Created by Luis Calle on 10/10/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface Question : NSObject

@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *difficulty;
@property (nonatomic, copy) NSString *question;
@property (nonatomic, copy) NSString *correctAnswer;
@property (nonatomic, copy) NSArray<NSString *> *incorrectAnswers;
@property (nonatomic, copy) NSMutableArray<NSString *> *allAnswers;

- (instancetype)initWith:(NSString *)category
                    type:(NSString *)type
              difficulty:(NSString *)difficulty
                question:(NSString *)question
           correctAnswer:(NSString *)correctAnswer
        incorrectAnswers:(NSArray<NSString *> *)incorrectAnswers;

- (instancetype)initWithDictionary:(NSDictionary *)questionDictionary;

@end

NS_ASSUME_NONNULL_END
