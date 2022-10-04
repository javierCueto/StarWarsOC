//
//  MenuLoadDataUseCase.m
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 30/09/22.
//

#import "MenuLoadDataUseCase.h"
#import "MenuRepository.h"

@interface MenuLoadDataUseCase ()
@property (nonatomic, strong) MenuRepository* menuRepository;
@end


@implementation MenuLoadDataUseCase

- (instancetype) initWithMenuRepository:(MenuRepository*)menuRepository{
    self = [self init];
    if (self) {
        _menuRepository = menuRepository;
    }
    return  self;
}

- (void)getMenu: (void(^)(NSMutableArray *arrayData))getMenu {
    
    [self.menuRepository fetchMenu:^(NSMutableArray *arrayData) {
        getMenu(arrayData);
    }];
}

@end
