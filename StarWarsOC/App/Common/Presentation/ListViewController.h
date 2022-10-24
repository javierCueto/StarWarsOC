//
//  ListViewController.h
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 03/10/22.
//

#import <UIKit/UIKit.h>
#import "ListViewModel.h"

NS_ASSUME_NONNULL_BEGIN


@protocol ListViewControllerDelegate <NSObject>
- (void) didItemWasSelected:(NSString*) urlPath;
@end

@interface ListViewController : UITableViewController
- (instancetype) initWithViewModel:(ListViewModel*) viewModel;
@property (nonatomic, weak) id <ListViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
