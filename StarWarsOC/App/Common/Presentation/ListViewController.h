//
//  ListViewController.h
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 03/10/22.
//

#import <UIKit/UIKit.h>
#import "ListViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListViewController : UITableViewController
- (instancetype) initWithViewModel:(ListViewModel*) viewModel;
@end

NS_ASSUME_NONNULL_END
