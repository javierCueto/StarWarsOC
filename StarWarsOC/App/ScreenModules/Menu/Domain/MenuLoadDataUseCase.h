//
//  MenuLoadDataUseCase.h
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 30/09/22.
//

#import <Foundation/Foundation.h>
#import "MenuRepository.h"

NS_ASSUME_NONNULL_BEGIN

@interface MenuLoadDataUseCase : NSObject
- (instancetype) initWithMenuRepository:(MenuRepository*)menuRepository;
- (void)getMenu: (void(^)(NSMutableArray *arrayData))getMenu;
@end

NS_ASSUME_NONNULL_END
