//
//  MenuRepository.h
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 30/09/22.
//

#import <Foundation/Foundation.h>
#import "ApiClient.h"

NS_ASSUME_NONNULL_BEGIN

@interface MenuRepository : NSObject
- (instancetype) initWithApiClient:(ApiClient*)apiClient;
- (void)fetchMenu: (void(^)(NSMutableArray* arrayData))fetchMenu;
@end

NS_ASSUME_NONNULL_END
