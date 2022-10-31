//
//  DetailFilmViewController.m
//  StarWarsOC
//
//  Created by Javier Cueto on 24/10/22.
//

#import "DetailFilmViewController.h"
#import "DetailFilmViewModel.h"

@interface DetailFilmViewController ()
@property (nonatomic, strong) DetailFilmViewModel* viewModel;
@end

@implementation DetailFilmViewController

- (instancetype) initWithViewModel:(DetailFilmViewModel*) viewModel {
    self = [super init];
    _viewModel = viewModel;
    [_viewModel addObserver:self forKeyPath:@"status" options: NSKeyValueObservingOptionNew context:NULL];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self.viewModel viewDidLoad];
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSNumber *statusNumber = [object valueForKey:@"status"];
            if (statusNumber.integerValue == success){
                [self configData];
            }else {
                
            }
        });
        
    }
}

- (void) configUI {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void) configData {
    self.title = self.viewModel.getTitle;
}


@end
