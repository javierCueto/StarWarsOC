//
//  ListLoadDataUseCase.m
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 03/10/22.
//

#import "ListLoadDataUseCase.h"
#import "FetchRepository.h"

@interface ListLoadDataUseCase ()
@property (nonatomic, strong) id<FetchRepository> fetchRepository;
@end


@implementation ListLoadDataUseCase

- (instancetype) initWithFetchRepository:(id<FetchRepository>)fetchRepository {
    self = [self init];
    if (self) {
        self.fetchRepository = fetchRepository;
    }
    return  self;
}


- (void)getList:(void (^)(NSMutableArray * _Nonnull))getList {
    
    [self.fetchRepository fetchData:^(NSMutableArray *arrayData) {
        getList(arrayData);
    }];
}

@end
