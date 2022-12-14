//
//  AppFactory.h
//  PokeOC
//
//  Created by Jose Javier Cueto Mejia on 27/09/22.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"
#import "StarWarsOC-Swift.h"
#import "ListViewController.h"

@interface AppFactory : NSObject <MenuViewControllerDelegate, SettingsViewControllerDelegate, ListViewControllerDelegate>
- (void) start: (UIWindow*_Nonnull) window;
@property (nonatomic, strong) UINavigationController * _Nonnull navController;
@end
