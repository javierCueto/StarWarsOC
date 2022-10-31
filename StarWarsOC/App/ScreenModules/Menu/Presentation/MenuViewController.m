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
@property (nonatomic, strong) UIActivityIndicatorView* spinner;
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
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Settings"
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(showPicker)];
    [self.navigationItem setRightBarButtonItem:button animated:YES];
    
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
    [self.view addSubview:self.spinner];
    self.spinner.translatesAutoresizingMaskIntoConstraints = false;
    [self.spinner.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [self.spinner.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.spinner startAnimating];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)  showPicker{
    [self.delegate didSelectSetting];
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSNumber *statusNumber = [object valueForKey:@"status"];
            if (statusNumber.integerValue == success){
                [self.spinner removeFromSuperview];
                [self.collectionView reloadData];
            }else {
                
            }
        });
        
    }
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
