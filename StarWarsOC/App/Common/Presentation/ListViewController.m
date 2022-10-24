//
//  ListViewController.m
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 03/10/22.
//

#import "ListViewController.h"
#import "ListViewCell.h"


@interface ListViewController ()
@property (nonatomic, strong) ListViewModel* viewModel;
@property (nonatomic, strong) UIActivityIndicatorView* spinner;
@end

@implementation ListViewController
static NSString * const reuseIdentifier = @"CellTable";

- (instancetype) initWithViewModel:(ListViewModel*) viewModel {
    self = [super init];
    _viewModel = viewModel;
    [_viewModel addObserver:self forKeyPath:@"status" options: NSKeyValueObservingOptionNew context:NULL];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.viewModel viewDidLoad];
    [self.tableView registerClass:[ListViewCell class] forCellReuseIdentifier:reuseIdentifier];
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
    [self.navigationController.view addSubview:self.spinner];
    self.spinner.translatesAutoresizingMaskIntoConstraints = false;
    [self.spinner.centerYAnchor constraintEqualToAnchor:self.navigationController.view.centerYAnchor].active = YES;
    [self.spinner.centerXAnchor constraintEqualToAnchor:self.navigationController.view.centerXAnchor].active = YES;
    [self.spinner startAnimating];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel count];
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSNumber *statusNumber = [object valueForKey:@"status"];
            if (statusNumber.integerValue == success){
                [self.spinner removeFromSuperview];
                [self.tableView reloadData];
            }else {
                
            }
        });
        
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    ListItem *data = [self.viewModel getListData:indexPath.row];
    [cell updateData:data];
    
    return cell;
}

- (void)dealloc
{
    [_viewModel removeObserver:self forKeyPath:@"status"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *url = [self.viewModel getURL:indexPath.row];
    NSLog(@"%@",url);
    [self.delegate didItemWasSelected:url];
}

@end
