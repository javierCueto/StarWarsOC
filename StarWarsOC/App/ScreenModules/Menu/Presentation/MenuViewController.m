//
//  MenuViewController.m
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 28/09/22.
//

#import "MenuViewController.h"
#import "MenuViewCell.h"
#import "MenuViewModel.h"

@interface MenuViewController ()
@property (nonatomic, strong) MenuViewModel* viewModel;
@end

@implementation MenuViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype) initWithLayout:(UICollectionViewFlowLayout*) layout withViewModel:(MenuViewModel*) viewModel {
    self = [super initWithCollectionViewLayout:layout];
    _viewModel = viewModel;
    [_viewModel addObserver:self forKeyPath:@"status" options: NSKeyValueObservingOptionNew context:NULL];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[MenuViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.title = @"Star Wars";
    [_viewModel loadData];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewDidAppear:animated];
    //[_viewModel removeObserver: self forKeyPath:@"status"];
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
        
    }
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_viewModel count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MenuViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSString *title = [self.viewModel getTitle:indexPath.row];
    [cell updateDataUIWithTitle:title];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MenuData *data = [self.viewModel getMenuData:indexPath.row];
    [self.delegate didMenuItemSelected:data];
}
@end
