//
//  DetailFilmViewController.h
//  StarWarsOC
//
//  Created by Javier Cueto on 24/10/22.
//

#import <UIKit/UIKit.h>
#import "DetailFilmViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailFilmViewController : UIViewController
- (instancetype) initWithViewModel:(DetailFilmViewModel*) viewModel;
@end

NS_ASSUME_NONNULL_END
