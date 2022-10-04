//
//  FilmsRepository.h
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 03/10/22.
//

#import <Foundation/Foundation.h>
#import "ApiClient.h"
#import "FetchRepository.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilmsRepository : NSObject <FetchRepository>
- (instancetype) initWithApiClient:(ApiClient*)apiClient withURLPath:(NSString*) url;
@end

NS_ASSUME_NONNULL_END
