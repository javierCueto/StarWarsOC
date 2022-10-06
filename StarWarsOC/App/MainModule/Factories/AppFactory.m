//
//  AppFactory.m
//  PokeOC
//
//  Created by Jose Javier Cueto Mejia on 27/09/22.
//

#import "AppFactory.h"
#import "MenuViewController.h"
#import "ApiClient.h"
#import "MenuViewModel.h"
#import "MenuRepository.h"
#import "ListViewController.h"
#import "ListLoadDataUseCase.h"
#import "ListViewModel.h"
#import "FilmsRepository.h"
#import "SpeciesRepository.h"
#import "StarWarsOC-Swift.h"

@implementation AppFactory

- (void) start: (UIWindow*) window {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    ApiClient *apiClient=[[ApiClient alloc] initWithSession:NSURLSession.sharedSession];
    MenuRepository *menuRepository=[[MenuRepository alloc] initWithApiClient:apiClient];
    MenuLoadDataUseCase *menuLoadDataUseCase=[[MenuLoadDataUseCase alloc] initWithMenuRepository:menuRepository];
    MenuViewModel *viewModel=[[MenuViewModel alloc] initWithMenuLoadDataUseCase:menuLoadDataUseCase];
    layout.itemSize = CGSizeMake((UIScreen.mainScreen.bounds.size.width/2) -15, 200);
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    MenuViewController *viewController = [[MenuViewController alloc] initWithLayout: layout withViewModel:viewModel];
    viewController.delegate = self;
    _navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    window.rootViewController = _navController;
    [window makeKeyAndVisible];
}


- (void)didMenuItemSelected:(nonnull MenuData *)menuData {
    
    if ([menuData.title isEqualToString:@"films"]) {
        [self makeFilmModule: menuData.url];
    } else {
        [self makeListModule: menuData.url];
    }
}

- (void)didSelectSetting {
    [self makeSettingsModule];
}



- (void)makeFilmModule:(nonnull NSString *)urlPath{
    ApiClient *apiClient=[[ApiClient alloc] initWithSession:NSURLSession.sharedSession];
    FilmsRepository *filmsRepository=[[FilmsRepository alloc] initWithApiClient:apiClient withURLPath:urlPath];
    ListLoadDataUseCase *filmsLoadDataUseCase=[[ListLoadDataUseCase alloc] initWithFetchRepository:filmsRepository];
    ListViewModel *viewModel=[[ListViewModel alloc] initWithListLoadDataUseCase:filmsLoadDataUseCase];
    ListViewController *viewController = [[ListViewController alloc] initWithViewModel:viewModel];
    [self.navController pushViewController:viewController animated:YES];
}

- (void)makeSettingsModule {
    SettingsViewController *viewController = [[SettingsViewController alloc] initWithDelegate:self];
   
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self.navController presentViewController:nav animated:true completion:nil];
}


- (void)makeListModule:(nonnull NSString *)urlPath{
    ApiClient *apiClient=[[ApiClient alloc] initWithSession:NSURLSession.sharedSession];
    SpeciesRepository *speciesRepository=[[SpeciesRepository alloc] initWithApiClient:apiClient withURLPath:urlPath];
    ListLoadDataUseCase *filmsLoadDataUseCase=[[ListLoadDataUseCase alloc] initWithFetchRepository:speciesRepository];
    ListViewModel *viewModel=[[ListViewModel alloc] initWithListLoadDataUseCase:filmsLoadDataUseCase];
    ListViewController *viewController = [[ListViewController alloc] initWithViewModel:viewModel];
    [self.navController pushViewController:viewController animated:YES];
}

- (void)didFinish {
    [self.navController dismissViewControllerAnimated:true completion:nil];
}


@end
