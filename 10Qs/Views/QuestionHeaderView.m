//
//  QuestionHeaderView.m
//  10Qs
//
//  Created by Luis Calle on 10/14/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import "QuestionHeaderView.h"


@interface QuestionHeaderView ()

@property (nonatomic, strong) UILabel *questionNumberLabel;
@property (nonatomic, strong) UILabel *questionLabel;

@end

@implementation QuestionHeaderView

- (instancetype)initWithFrame:(CGRect)frame questionNumber:(NSInteger)number question:(NSString *)question
{
    self = [super initWithFrame:frame];
    if (self) {
        _questionLabel = [[UILabel alloc] init];
        _questionLabel.text = question;
        _questionNumberLabel = [[UILabel alloc] init];
        _questionNumberLabel.text = [NSString stringWithFormat:@"Question %zd", number + 1];
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    self.backgroundColor = UIColor.groupTableViewBackgroundColor;
    [self setupQuestionNumberLabel];
    [self setupQuestionLabel];
}

- (void)setupQuestionNumberLabel
{
    self.questionNumberLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.questionNumberLabel.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:25];
    [self addSubview:self.questionNumberLabel];
    [NSLayoutConstraint activateConstraints:@[
                                              [self.questionNumberLabel.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor constant:8],
                                              [self.questionNumberLabel.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant:8],
                                              [self.questionNumberLabel.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor constant:-8]
                                              ]];
}

- (void)setupQuestionLabel
{
    self.questionLabel.numberOfLines = 0;
    self.questionLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.questionLabel.font = [UIFont fontWithName:@"TrebuchetMS" size:18];
    [self addSubview:self.questionLabel];
    [NSLayoutConstraint activateConstraints:@[
                                              [self.questionLabel.topAnchor constraintEqualToAnchor:self.questionNumberLabel.bottomAnchor constant:4],
                                              [self.questionLabel.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant:8],
                                              [self.questionLabel.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor constant:-8],
                                              [self.questionLabel.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor constant:-8]
                                              ]];
}

@end
