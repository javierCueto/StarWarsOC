//
//  MenuData.h
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 30/09/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuData : NSObject
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *url;
- (instancetype) initWithTitle: (NSString *)title andUrl: (NSString *)url ;
@end

NS_ASSUME_NONNULL_END
