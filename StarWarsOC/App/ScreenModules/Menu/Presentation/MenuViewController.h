//
//  MenuViewController.h
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 28/09/22.
//

#import <UIKit/UIKit.h>
#import "ApiClient.h"
#import "MenuViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MenuViewControllerDelegate <NSObject>
- (void) didMenuItemSelected:(MenuData *) menuData;
- (void) didSelectSetting;
@end

@interface MenuViewController: UICollectionViewController
- (instancetype) initWithLayout:(UICollectionViewFlowLayout*) layout withViewModel:(MenuViewModel*) viewModel;
@property (nonatomic, weak) id <MenuViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
