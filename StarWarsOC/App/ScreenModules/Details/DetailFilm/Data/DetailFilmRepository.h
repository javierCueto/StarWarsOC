//
//  FilmRepository.h
//  StarWarsOC
//
//  Created by Javier Cueto on 31/10/22.
//

#import <Foundation/Foundation.h>
#import "ApiClient.h"
#import "ListItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailFilmRepository : NSObject
- (instancetype) initWithApiClient:(ApiClient*)apiClient withURLPath:(NSString*) url;
- (void)fetchData: (void(^)(ListItem* film))fetchFilm;
@end

NS_ASSUME_NONNULL_END
