//
//  ListLoadDataUseCase.h
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 03/10/22.
//

#import <Foundation/Foundation.h>
#import "FetchRepository.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListLoadDataUseCase : NSObject
- (instancetype) initWithFetchRepository:(id<FetchRepository>)fetchRepository;
- (void)getList: (void(^)(NSMutableArray *arrayData))getList;
@end

NS_ASSUME_NONNULL_END
