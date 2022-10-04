//
//  FetchRepository.h
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 04/10/22.
//

#import <Foundation/Foundation.h>


@protocol FetchRepository <NSObject>
- (void)fetchData: (void(^)(NSMutableArray* arrayData))fetchFilms;
@end
