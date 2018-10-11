//
//  TenQsViewController.m
//  10Qs
//
//  Created by Luis Calle on 10/10/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import "TenQsViewController.h"

@interface TenQsViewController ()

@property (nonatomic, weak) IBOutlet UITableView *questionsTableView;
@property (nonatomic, strong) TenQsViewModel *viewModel;

@end

@implementation TenQsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.questionsTableView setDelegate:self];
    [self.questionsTableView setDataSource:self];
    self.viewModel = [[TenQsViewModel alloc] init];
    [self.viewModel setDelegate:self];
    [self.viewModel fetchQuestions];
}

#pragma mark TenQsViewModelDelegate

- (void)viewModeldidFinishWith:(TenQsViewModelState)state {
    switch (state) {
        case TenQsViewModelStateSucceed:
            NSLog(@"Succeed");
            [self.questionsTableView reloadData];
            break;
        case TenQsViewModelStateFail:
            NSLog(@"Succeed");
            break;
    }
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Testing for picking the choices
    NSLog(@"%@", [[[[_viewModel questions] objectAtIndex:indexPath.section] allAnswers] objectAtIndex:indexPath.row]);
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.viewModel numberOfQuestions];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.viewModel getQuestionTextAtSection:section];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfChoicesInQuestion:section];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *questionCell = [tableView dequeueReusableCellWithIdentifier:@"question cell"];
    if (questionCell == nil) {
        questionCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"question cell"];
    }
    questionCell.textLabel.text = [_viewModel getAnswerChoiceAtIndexPath:indexPath];
    return questionCell;
}

@end
