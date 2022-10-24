//
//  ListViewModel.m
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 03/10/22.
//

#import "ListViewModel.h"

@interface ListViewModel ()
@property (nonatomic, strong) ListLoadDataUseCase* listLoadDataUseCase;
@property (nonatomic, strong) NSMutableArray *arrayData;
@end

@implementation ListViewModel

- (instancetype) initWithListLoadDataUseCase:(ListLoadDataUseCase*)listLoadDataUseCase {
    self = [self init];
    if (self) {
        self.listLoadDataUseCase = listLoadDataUseCase;
    }
    return  self;
}

- (void)viewDidLoad {
    [self setStatus:loading];
    
    [self.listLoadDataUseCase getList:^(NSMutableArray * _Nonnull arrayData) {
        [self setStatus:success];
        [self setCount:arrayData.count];
        self.arrayData = arrayData;
        [self setStatus:success];
        
    }];
}

- (ListItem*)getListData: (NSInteger) index {
    ListItem *data = (ListItem *)self.arrayData[index];
    return  data;
}

- (NSString*)getURL: (NSInteger) index {
    
    ListItem *data = (ListItem *)self.arrayData[index];
    NSLog(@"%@",data.title);
    NSLog(@"%@",data.opening);
    return  data.urlPath;
}
@end
