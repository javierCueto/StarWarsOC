//
//  ListViewModel.h
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 03/10/22.
//

#import <Foundation/Foundation.h>
#import "ListLoadDataUseCase.h"
#import "StatusRequest.h"
#import "ListItem.h"


@interface ListViewModel : NSObject
@property (nonatomic, assign) StatusRequest status;
- (void)viewDidLoad;
- (instancetype) initWithListLoadDataUseCase:(ListLoadDataUseCase*)listLoadDataUseCase;
@property (nonatomic, assign) NSInteger count;
- (ListItem*)getListData: (NSInteger) index;
@end
