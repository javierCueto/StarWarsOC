//
//  MenuViewModel.h
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 29/09/22.
//

#import <Foundation/Foundation.h>
#import "StatusRequest.h"
#import "MenuLoadDataUseCase.h"
#import "MenuData.h"


@interface MenuViewModel : NSObject
- (void)loadData;
@property (nonatomic, assign) StatusRequest status;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSMutableArray *arrayData;

- (instancetype) initWithMenuLoadDataUseCase:(MenuLoadDataUseCase*)menuLoadDataUseCase;

- (NSString*)getTitle: (NSInteger) index;
- (MenuData*)getMenuData: (NSInteger) index;
@end

