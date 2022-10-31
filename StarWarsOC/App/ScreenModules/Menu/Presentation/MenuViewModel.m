//
//  MenuViewModel.m
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 29/09/22.
//

#import "MenuViewModel.h"
#import "ApiClient.h"
#import "StatusRequest.h"
#import "MenuData.h"


@interface MenuViewModel ()
@property (nonatomic, strong) MenuLoadDataUseCase* menuLoadDataUseCase;
@end


@implementation MenuViewModel

- (instancetype) initWithMenuLoadDataUseCase:(MenuLoadDataUseCase*)menuLoadDataUseCase;{
    self = [self init];
    if (self) {
        _menuLoadDataUseCase = menuLoadDataUseCase;
    }
    return  self;
}


- (void) loadData {
    [self setStatus:loading];
    
    [self.menuLoadDataUseCase getMenu:^(NSMutableArray * arrayData) {
        [self setCount:arrayData.count];
        self.arrayData = arrayData;
        [self setStatus:success];
    }];
    
}

- (NSString*)getTitle: (NSInteger) index {
    if (self.arrayData!=NULL) {
        MenuData *data = (MenuData *)self.arrayData[index];
        return  data.title;
    }
    return @"No Data";
}

- (MenuData*)getMenuData: (NSInteger) index {
    MenuData *data = (MenuData *)self.arrayData[index];
    return  data;
}

@end
