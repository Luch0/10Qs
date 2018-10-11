//
//  TenQsViewModel.h
//  10Qs
//
//  Created by Luis Calle on 10/10/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"
#import "TenQsAPIClient.h"

@protocol TenQsViewModelDelegate;


NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, TenQsViewModelState) {
    TenQsViewModelStateSucceed,
    TenQsViewModelStateFail
};

@interface TenQsViewModel : NSObject

@property (nonatomic, weak) id<TenQsViewModelDelegate> delegate;
@property (nonatomic, copy) NSArray<Question *> *questions;

- (void)fetchQuestions;
- (NSString *)getQuestionTextAtSection:(NSInteger )section;
- (NSString *)getAnswerChoiceAtIndexPath:(NSIndexPath *)indexPath;
- (NSUInteger)numberOfQuestions;
- (NSUInteger)numberOfChoicesInQuestion:(NSInteger)section;

@end

@protocol TenQsViewModelDelegate <NSObject>

- (void)viewModeldidFinishWith:(TenQsViewModelState)state;

@end

NS_ASSUME_NONNULL_END
