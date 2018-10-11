//
//  TenQsViewController.h
//  10Qs
//
//  Created by Luis Calle on 10/10/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TenQsViewModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface TenQsViewController : UIViewController <TenQsViewModelDelegate,
                                                   UITableViewDelegate,
                                                   UITableViewDataSource>

@end

NS_ASSUME_NONNULL_END
