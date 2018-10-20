//
//  QuestionHeaderView.m
//  10Qs
//
//  Created by Luis Calle on 10/14/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import "QuestionHeaderView.h"


@interface QuestionHeaderView ()

@property (nonatomic, strong) UILabel *questionLabel;

@end

@implementation QuestionHeaderView

- (instancetype)initWithFrame:(CGRect)frame question:(NSString *)question
{
    self = [super initWithFrame:frame];
    if (self) {
        _questionLabel = [[UILabel alloc] init];
        _questionLabel.text = question;
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    self.backgroundColor = UIColor.groupTableViewBackgroundColor;
    [self setupQuestionLabel];
}

- (void)setupQuestionLabel
{
    self.questionLabel.numberOfLines = 0;
    self.questionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.questionLabel];
    [NSLayoutConstraint activateConstraints:@[
                                              [self.questionLabel.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor constant:8],
                                              [self.questionLabel.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor constant:8],
                                              [self.questionLabel.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor constant:-8],
                                              [self.questionLabel.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor constant:-8]
                                              ]];
}

@end
